import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/domain/usecases/expense_usecase.dart';
import 'package:spending/domain/usecases/income_usecase.dart';
import 'package:spending/domain/usecases/spending_usecase.dart';
import 'package:spending/presentation/screens/home/home_screen.dart';
import 'package:spending/presentation/screens/sync/bloc/sync_event.dart';
import 'package:spending/presentation/screens/sync/bloc/sync_state.dart';

@lazySingleton
class SyncBloc extends Bloc<SyncEvent, SyncState> {
  final SpendingUseCase _spendingUseCase;
  final ExpenseUseCase _expenseUseCase;
  final IncomeUseCase _incomUseCase;

  SyncBloc(
    this._spendingUseCase,
    this._expenseUseCase,
    this._incomUseCase,
  ) : super(const SyncState()) {
    on<SyncInitial>(_initial);
    on<SyncStarted>(_started);
  }

  void _initial(SyncInitial event, Emitter<SyncState> emit) =>
      emit(const SyncState());

  void _started(SyncStarted event, Emitter<SyncState> emit) async {
    final context = event.context;

    try {
      final spendings = await _spendingUseCase.findAllRemote();
      for (var spending in spendings) {
        await _spendingUseCase.insertOne(spending);
      }

      final expenses = await _expenseUseCase.findAllByUserIdRemote();
      for (var expense in expenses) {
        await _expenseUseCase.insertOne(expense);
      }

      final incomes = await _incomUseCase.findAllByUserIdRemote();
      for (var income in incomes) {
        await _incomUseCase.insertOne(income);
      }

      if (!context.mounted) {
        return Toast.show('Context not mounted');
      }

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ), (route) => false);

      context.read<SyncBloc>().add(const SyncInitial());
      Toast.show('Synchronization was successful');
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }
}
