import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_event.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  copyWith: false,
  toJson: false,
  fromJson: false,
)
abstract class SyncEvent with _$SyncEvent {
  const factory SyncEvent.initial() = SyncInitial;

  const factory SyncEvent.started({
    required final BuildContext context,
  }) = SyncStarted;
}
