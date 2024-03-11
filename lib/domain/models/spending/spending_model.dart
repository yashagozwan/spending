import 'package:freezed_annotation/freezed_annotation.dart';

part 'spending_model.freezed.dart';

part 'spending_model.g.dart';

@freezed
class SpendingModel with _$SpendingModel {
  const factory SpendingModel({
    @Default('') String id,
    @Default('') String title,
    @Default('') @JsonKey(name: 'user_id') String userId,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
  }) = _SpendingModel;

  factory SpendingModel.fromJson(Map<String, dynamic> json) =>
      _$SpendingModelFromJson(json);
}
