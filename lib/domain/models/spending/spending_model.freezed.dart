// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SpendingModel _$SpendingModelFromJson(Map<String, dynamic> json) {
  return _SpendingModel.fromJson(json);
}

/// @nodoc
mixin _$SpendingModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpendingModelCopyWith<SpendingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingModelCopyWith<$Res> {
  factory $SpendingModelCopyWith(
          SpendingModel value, $Res Function(SpendingModel) then) =
      _$SpendingModelCopyWithImpl<$Res, SpendingModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$SpendingModelCopyWithImpl<$Res, $Val extends SpendingModel>
    implements $SpendingModelCopyWith<$Res> {
  _$SpendingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpendingModelImplCopyWith<$Res>
    implements $SpendingModelCopyWith<$Res> {
  factory _$$SpendingModelImplCopyWith(
          _$SpendingModelImpl value, $Res Function(_$SpendingModelImpl) then) =
      __$$SpendingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$SpendingModelImplCopyWithImpl<$Res>
    extends _$SpendingModelCopyWithImpl<$Res, _$SpendingModelImpl>
    implements _$$SpendingModelImplCopyWith<$Res> {
  __$$SpendingModelImplCopyWithImpl(
      _$SpendingModelImpl _value, $Res Function(_$SpendingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$SpendingModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingModelImpl implements _SpendingModel {
  const _$SpendingModelImpl(
      {this.id = '',
      this.title = '',
      @JsonKey(name: 'user_id') this.userId = '',
      @JsonKey(name: 'created_at') this.createdAt = ''});

  factory _$SpendingModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'SpendingModel(id: $id, title: $title, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingModelImplCopyWith<_$SpendingModelImpl> get copyWith =>
      __$$SpendingModelImplCopyWithImpl<_$SpendingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingModelImplToJson(
      this,
    );
  }
}

abstract class _SpendingModel implements SpendingModel {
  const factory _SpendingModel(
          {final String id,
          final String title,
          @JsonKey(name: 'user_id') final String userId,
          @JsonKey(name: 'created_at') final String createdAt}) =
      _$SpendingModelImpl;

  factory _SpendingModel.fromJson(Map<String, dynamic> json) =
      _$SpendingModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$SpendingModelImplCopyWith<_$SpendingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
