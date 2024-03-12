import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/domain/models/spending/spending_model.dart';

part 'home_event.freezed.dart';

@Freezed(
  copyWith: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  makeCollectionsUnmodifiable: true,
  toJson: false,
  fromJson: false,
)
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = HomeInitial;

  const factory HomeEvent.started() = HomeStarted;

  const factory HomeEvent.logout({
    required final BuildContext context,
  }) = HomeLogout;

  const factory HomeEvent.showUserDetailBottomSheet({
    required final BuildContext context,
  }) = HomeShowUserDetailBottomSheet;

  const factory HomeEvent.createReport() = HomeCreateReport;

  const factory HomeEvent.updateReport({
    required final SpendingModel spending,
  }) = HomeUpdateReport;

  const factory HomeEvent.setSpendingTitle({
    required String value,
  }) = HomeSetSpendingTitle;

  const factory HomeEvent.setDateIso({
    required String value,
  }) = HomeSetDateIso;

  const factory HomeEvent.showCreateReportBottomSheet({
    required final BuildContext context,
    required final TextEditingController titleController,
    required final TextEditingController dateController,
    required final TextEditingController datePreviewController,
    @Default(false) bool isUpdate,
    SpendingModel? spending,
  }) = HomeShowCreateReportBottomSheet;

  const factory HomeEvent.showRemoveAlertDialog({
    required final BuildContext context,
    required final SpendingModel spending,
  }) = HomeRemoveShowAlertDialog;

  const factory HomeEvent.removeSpending({
    required final SpendingModel spending,
  }) = HomeRemoveSpending;
}
