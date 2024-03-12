import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';

part 'expense_model.g.dart';

@freezed
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @Default('') String id,
    @Default('') String title,
    @Default(0) int amount,
    @Default('') @JsonKey(name: 'spending_id') String spendingId,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}
