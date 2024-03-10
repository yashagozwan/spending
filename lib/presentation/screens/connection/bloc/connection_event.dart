import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_event.freezed.dart';

@Freezed(
  copyWith: false,
  toJson: false,
  map: FreezedMapOptions.none,
  when: FreezedWhenOptions.none,
)
abstract class ConnectionEvent with _$ConnectionEvent {
  const factory ConnectionEvent.initial({
    required final BuildContext context,
  }) = ConnectionInitial;

  const factory ConnectionEvent.setContext({
    required final BuildContext context,
  }) = ConnectionSetContext;

  const factory ConnectionEvent.destroy() = ConnectionDestroy;
}
