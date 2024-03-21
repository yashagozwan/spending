import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/domain/models/expense/expense_model.dart';
import 'package:spending/domain/models/income/income_model.dart';
import 'package:spending/domain/usecases/expense_usecase.dart';
import 'package:spending/domain/usecases/income_usecase.dart';
import 'package:spending/domain/usecases/spending_usecase.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_event.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_state.dart';
import 'package:spending/presentation/screens/spending/spending_screen.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

@lazySingleton
class SpendingBloc extends Bloc<SpendingEvent, SpendingState> {
  final SpendingUseCase _spendingUseCase;
  final ExpenseUseCase _expenseUseCase;
  final IncomeUseCase _incomeUseCase;
  final Logger _logger;

  SpendingBloc(
    this._spendingUseCase,
    this._expenseUseCase,
    this._incomeUseCase,
    this._logger,
  ) : super(const SpendingState()) {
    on<SpendingInitial>(_initial);
    on<SpendingStarted>(_started);
    on<SpendingSetId>(_setSpendingId);
    on<SpendingShowCreateExpenseModalDialog>(_showCreateExpenseModalDialog);
    on<SpendingSetExpenseTitle>(_setExpenseTitle);
    on<SpendingSetExpenseAmount>(_setExpenseAmount);
    on<SpendingSetIncomeTitle>(_setIncomeTitle);
    on<SpendingSetIncomeAmount>(_setIncomeAmount);
    on<SpendingCreateExpanse>(_createExpanse);
    on<SpendingCreateIncome>(_createIncome);
    on<SpendingShowCreateIncomeBottomSheet>(_showCreateIncomeModalDialog);
    on<SpendingRemoveExpense>(_removeExpanse);
  }

  void _initial(SpendingInitial event, Emitter<SpendingState> emit) {
    return _resetState(emit);
  }

  void _createIncome(
    SpendingCreateIncome event,
    Emitter<SpendingState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final income = IncomeModel(
        title: state.incomeTitle,
        amount: state.incomeAmount,
        spendingId: state.spending.id,
        userId: state.spending.userId,
        createdAt: DateTime.now().toIso8601String(),
      );

      await _incomeUseCase.insertOneNetwork(income);

      final incomes = await _incomeUseCase.findAll(state.spending.id);

      emit(
        state.copyWith(
          incomes: incomes,
          status: Status.success,
        ),
      );

      Toast.show('Income Created');
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
      Toast.show('$e', isError: true);
    }
  }

  void _removeExpanse(
    SpendingRemoveExpense event,
    Emitter<SpendingState> emit,
  ) async {
    try {
      await _expenseUseCase.removeOne(event.expense);
      emit(
        state.copyWith(
          expenses: await _expenseUseCase.findAll(
            state.spending.id,
          ),
        ),
      );
      Toast.show('Expanse Removed');
    } catch (e) {
      Toast.show('$e', isError: true);
    }
  }

  void _createExpanse(
    SpendingCreateExpanse event,
    Emitter<SpendingState> emit,
  ) async {
    try {
      final expense = ExpenseModel(
        title: state.expanseTitle,
        amount: state.expanseAmount,
        spendingId: state.spending.id,
        createdAt: DateTime.now().toIso8601String(),
      );

      await _expenseUseCase.insertOneNetwork(expense);
      final expenses = await _expenseUseCase.findAll(state.spending.id);
      emit(state.copyWith(expenses: expenses, status: Status.success));
      Toast.show('Expanse Created');
    } catch (e) {
      Toast.show('$e', isError: true);
      _logger.d(e);
    }
  }

  String _getOnlyNumber(String value) {
    return value.replaceAll('.', '').replaceAll(',', '');
  }

  void _setExpenseTitle(
    SpendingSetExpenseTitle event,
    Emitter<SpendingState> emit,
  ) =>
      emit(state.copyWith(expanseTitle: event.value));

  void _setExpenseAmount(
    SpendingSetExpenseAmount event,
    Emitter<SpendingState> emit,
  ) {
    if (event.value.isEmpty) return;
    final value = _getOnlyNumber(event.value);
    emit(state.copyWith(expanseAmount: int.parse(value)));
  }

  void _setIncomeTitle(
    SpendingSetIncomeTitle event,
    Emitter<SpendingState> emit,
  ) =>
      emit(state.copyWith(incomeTitle: event.value));

  void _setIncomeAmount(
    SpendingSetIncomeAmount event,
    Emitter<SpendingState> emit,
  ) {
    if (event.value.isEmpty) return;
    final value = _getOnlyNumber(event.value);
    emit(state.copyWith(incomeAmount: int.parse(value)));
  }

  void _resetState(Emitter<SpendingState> emit) => emit(const SpendingState());

  void _started(SpendingStarted event, Emitter<SpendingState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final spending = await _spendingUseCase.findOne(state.id);
      final expenses = await _expenseUseCase.findAll(spending.id);
      final incomes = await _incomeUseCase.findAll(spending.id);

      emit(state.copyWith(
        status: Status.success,
        spending: spending,
        expenses: expenses,
        incomes: incomes,
      ));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
      Toast.show('$e', isError: true);
    }
  }

  void _setSpendingId(SpendingSetId event, Emitter<SpendingState> emit) {
    _resetState(emit);

    final context = event.context;
    emit(state.copyWith(id: event.id));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return const SpendingScreen();
      },
    ));
  }

  void _showCreateExpenseModalDialog(
    SpendingShowCreateExpenseModalDialog event,
    Emitter<SpendingState> emit,
  ) async {
    final context = event.context;
    final titleController = event.titleController;
    final amountController = event.amountController;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Expanse',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'What is the name of the need??',
                style: TextStyle(),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: titleController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Write...',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'How much did you spend',
                style: TextStyle(),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: amountController,
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                    thousandSeparator: ThousandSeparator.Period,
                    mantissaLength: 0,
                  ),
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter Amount',
                  prefixIcon: SizedBox(
                    width: 20,
                    height: 30,
                    child: Center(
                      child: Text('Rp'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SpendingBloc, SpendingState>(
                builder: (context, state) {
                  VoidCallback? onPressed;

                  if (state.expanseTitle.isNotEmpty &&
                      state.expanseAmount != 0) {
                    onPressed = () {
                      context
                          .read<SpendingBloc>()
                          .add(const SpendingCreateExpanse());

                      Navigator.pop(context);

                      titleController.clear();
                      amountController.clear();
                    };
                  }

                  return ElevatedButton(
                    onPressed: onPressed,
                    child: const Text('CREATE'),
                  );
                },
              )
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }

  void _showCreateIncomeModalDialog(
    SpendingShowCreateIncomeBottomSheet event,
    Emitter<SpendingState> emit,
  ) async {
    final context = event.context;
    final titleController = event.titleController;
    final amountController = event.amountController;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create Income',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'What is the name of the need??',
                style: TextStyle(),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: titleController,
                style: const TextStyle(fontSize: 14),
                decoration: const InputDecoration(
                  hintText: 'Write...',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'How much did you got',
                style: TextStyle(),
              ),
              const SizedBox(height: 4),
              TextField(
                controller: amountController,
                style: const TextStyle(fontSize: 14),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  CurrencyInputFormatter(
                    thousandSeparator: ThousandSeparator.Period,
                    mantissaLength: 0,
                  ),
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter Amount',
                  prefixIcon: SizedBox(
                    width: 20,
                    height: 30,
                    child: Center(
                      child: Text('Rp'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<SpendingBloc, SpendingState>(
                builder: (context, state) {
                  VoidCallback? onPressed;

                  if (state.incomeTitle.isNotEmpty && state.incomeAmount != 0) {
                    onPressed = () {
                      context
                          .read<SpendingBloc>()
                          .add(const SpendingCreateIncome());

                      Navigator.pop(context);

                      titleController.clear();
                      amountController.clear();
                    };
                  }

                  return ElevatedButton(
                    onPressed: onPressed,
                    child: const Text('CREATE'),
                  );
                },
              )
            ],
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
    );
  }
}
