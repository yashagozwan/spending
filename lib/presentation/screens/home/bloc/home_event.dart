import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@Freezed(
  copyWith: false,
  makeCollectionsUnmodifiable: true,
  when: FreezedWhenOptions.none,
  toJson: false,
  map: FreezedMapOptions.none,
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
}
