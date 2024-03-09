import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Status.initial) Status status,
  }) = _LoginState;
}
