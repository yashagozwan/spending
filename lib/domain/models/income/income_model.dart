import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_model.freezed.dart';

part 'income_model.g.dart';

@freezed
class IncomeModel with _$IncomeModel {
  const factory IncomeModel({
    @Default('') String id,
    @Default('') String title,
    @Default(0) int amount,
    @Default('') @JsonKey(name: 'spending_id') String spendingId,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
  }) = _IncomeModel;

  factory IncomeModel.fromJson(Map<String, dynamic> json) =>
      _$IncomeModelFromJson(json);
}
