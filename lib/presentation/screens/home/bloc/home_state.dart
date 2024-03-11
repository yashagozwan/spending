import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spending/core/constants/status.dart';
import 'package:spending/domain/models/spending/spending_model.dart';
import 'package:spending/domain/models/user/user_model.dart';

part 'home_state.freezed.dart';

@Freezed(
  map: FreezedMapOptions.none,
  fromJson: false,
  toJson: false,
  when: FreezedWhenOptions.none,
)
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    @Default(UserModel()) UserModel user,
    @Default([]) List<SpendingModel> spendings,
    @Default('') String spendingTitle,
    @Default('') String dateIso,
  }) = _HomeState;
}
