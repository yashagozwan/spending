import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@Freezed(
  copyWith: false,
  makeCollectionsUnmodifiable: true,
  when: FreezedWhenOptions.none,
)
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initial() = HomeInitial;

  const factory HomeEvent.logout({
    required final BuildContext context,
  }) = HomeLogout;
}
