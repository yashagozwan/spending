import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

  const factory SpendingEvent.showCreateExpenseBottomSheet({
    required final BuildContext context,
    required final TextEditingController titleController,
    required final TextEditingController amountController,
  }) = SpendingShowCreateExpenseModalDialog;
}
