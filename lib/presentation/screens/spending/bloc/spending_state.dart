import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/domain/models/expense/expense_model.dart';
import 'package:spending/domain/models/income/income_model.dart';
import 'package:spending/domain/models/spending/spending_model.dart';

part 'spending_state.freezed.dart';

@Freezed(
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
  toJson: false,
  fromJson: false,
  makeCollectionsUnmodifiable: true,
  unionValueCase: FreezedUnionCase.none,
)
class SpendingState with _$SpendingState {
  const factory SpendingState({
    @Default(Status.initial) Status status,
    @Default('') String id,
    @Default(SpendingModel()) SpendingModel spending,
    @Default('') String expanseTitle,
    @Default(0) int expanseAmount,
    @Default([]) List<ExpenseModel> expenses,
    @Default([]) List<IncomeModel> incomes,
  }) = _SpendingState;
}
