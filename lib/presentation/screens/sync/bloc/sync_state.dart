import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';

part 'sync_state.freezed.dart';

@Freezed()
class SyncState with _$SyncState {
  const factory SyncState({
    @Default(Status.initial) Status status,
  }) = _SyncState;
}
