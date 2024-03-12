import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/core/utils/toast.dart';
import 'package:spending/domain/usecases/spending_usecase.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_event.dart';
import 'package:spending/presentation/screens/spending/bloc/spending_state.dart';
import 'package:spending/presentation/screens/spending/spending_screen.dart';

@lazySingleton
class SpendingBloc extends Bloc<SpendingEvent, SpendingState> {
  final SpendingUseCase _spendingUseCase;

  SpendingBloc(this._spendingUseCase) : super(const SpendingState()) {
    on<SpendingInitial>(_initial);
    on<SpendingStarted>(_started);
    on<SpendingSetId>(_setSpendingId);
  }

  void _initial(SpendingInitial event, Emitter<SpendingState> emit) {
    return _resetState(emit);
  }

  void _resetState(Emitter<SpendingState> emit) => emit(const SpendingState());

  void _started(SpendingStarted event, Emitter<SpendingState> emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final spending = await _spendingUseCase.findOne(state.id);
      emit(state.copyWith(spending: spending, status: Status.success));
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
}
