import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(Status.initial) Status status,
  }) = _SplashState;
}
