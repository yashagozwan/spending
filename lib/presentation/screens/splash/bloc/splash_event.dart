import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  fromJson: false,
  map: FreezedMapOptions.none,
  toJson: false,
  copyWith: false,
  makeCollectionsUnmodifiable: true,
)
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.initial({
    required final BuildContext context,
  }) = SplashInitial;

  const factory SplashEvent.started({
    required final BuildContext context,
  }) = SplashStarted;
}
