import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
  fromJson: false,
  toJson: false,
)
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.initial() = LoginInitial;

  const factory LoginEvent.signInWithGoogle({
    required final BuildContext context,
  }) = LoginSignInWithGoogle;

  const factory LoginEvent.signOut() = LoginSignOut;
}
