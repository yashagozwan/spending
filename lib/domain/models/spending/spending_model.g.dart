// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingModelImpl _$$SpendingModelImplFromJson(Map<String, dynamic> json) =>
    _$SpendingModelImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$$SpendingModelImplToJson(_$SpendingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
    };
