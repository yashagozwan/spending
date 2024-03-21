import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/domain/models/expense/expense_model.dart';

part 'spending_event.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  toJson: false,
  fromJson: false,
  copyWith: false,
)
abstract class SpendingEvent with _$SpendingEvent {
  const factory SpendingEvent.initial() = SpendingInitial;

  const factory SpendingEvent.started() = SpendingStarted;

  const factory SpendingEvent.createExpanse() = SpendingCreateExpanse;

  const factory SpendingEvent.createIncome() = SpendingCreateIncome;

  const factory SpendingEvent.removeExpense({
    required ExpenseModel expense,
  }) = SpendingRemoveExpense;

  const factory SpendingEvent.setExpenseTitle({
    required final String value,
  }) = SpendingSetExpenseTitle;

  const factory SpendingEvent.setExpenseAmount({
    required final String value,
  }) = SpendingSetExpenseAmount;

  const factory SpendingEvent.setId({
    required final String id,
    required final BuildContext context,
  }) = SpendingSetId;

  const factory SpendingEvent.setIncomeTitle({
    required final String value,
  }) = SpendingSetIncomeTitle;

  const factory SpendingEvent.setIncomeAmount({
    required final String value,
  }) = SpendingSetIncomeAmount;

  const factory SpendingEvent.showCreateExpenseBottomSheet({
    required final BuildContext context,
    required final TextEditingController titleController,
    required final TextEditingController amountController,
  }) = SpendingShowCreateExpenseModalDialog;

  const factory SpendingEvent.showCreateIncomeBottomSheet({
    required final BuildContext context,
    required final TextEditingController titleController,
    required final TextEditingController amountController,
  }) = SpendingShowCreateIncomeBottomSheet;
}
