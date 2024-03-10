import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';

part 'connection_state.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  toJson: false,
  fromJson: false,
)
class ConnectionState with _$ConnectionState {
  const factory ConnectionState({
    @Default(Status.initial) Status status,
    BuildContext? context,
  }) = _ConnectionInitial;
}
