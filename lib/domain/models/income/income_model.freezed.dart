// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'income_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncomeModel _$IncomeModelFromJson(Map<String, dynamic> json) {
  return _IncomeModel.fromJson(json);
}

/// @nodoc
mixin _$IncomeModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'spending_id')
  String get spendingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncomeModelCopyWith<IncomeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncomeModelCopyWith<$Res> {
  factory $IncomeModelCopyWith(
          IncomeModel value, $Res Function(IncomeModel) then) =
      _$IncomeModelCopyWithImpl<$Res, IncomeModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      int amount,
      @JsonKey(name: 'spending_id') String spendingId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class _$IncomeModelCopyWithImpl<$Res, $Val extends IncomeModel>
    implements $IncomeModelCopyWith<$Res> {
  _$IncomeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? spendingId = null,
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
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      spendingId: null == spendingId
          ? _value.spendingId
          : spendingId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$IncomeModelImplCopyWith<$Res>
    implements $IncomeModelCopyWith<$Res> {
  factory _$$IncomeModelImplCopyWith(
          _$IncomeModelImpl value, $Res Function(_$IncomeModelImpl) then) =
      __$$IncomeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      int amount,
      @JsonKey(name: 'spending_id') String spendingId,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'created_at') String createdAt});
}

/// @nodoc
class __$$IncomeModelImplCopyWithImpl<$Res>
    extends _$IncomeModelCopyWithImpl<$Res, _$IncomeModelImpl>
    implements _$$IncomeModelImplCopyWith<$Res> {
  __$$IncomeModelImplCopyWithImpl(
      _$IncomeModelImpl _value, $Res Function(_$IncomeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? amount = null,
    Object? spendingId = null,
    Object? userId = null,
    Object? createdAt = null,
  }) {
    return _then(_$IncomeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      spendingId: null == spendingId
          ? _value.spendingId
          : spendingId // ignore: cast_nullable_to_non_nullable
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
class _$IncomeModelImpl implements _IncomeModel {
  const _$IncomeModelImpl(
      {this.id = '',
      this.title = '',
      this.amount = 0,
      @JsonKey(name: 'spending_id') this.spendingId = '',
      @JsonKey(name: 'user_id') this.userId = '',
      @JsonKey(name: 'created_at') this.createdAt = ''});

  factory _$IncomeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncomeModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int amount;
  @override
  @JsonKey(name: 'spending_id')
  final String spendingId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;

  @override
  String toString() {
    return 'IncomeModel(id: $id, title: $title, amount: $amount, spendingId: $spendingId, userId: $userId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncomeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.spendingId, spendingId) ||
                other.spendingId == spendingId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, amount, spendingId, userId, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncomeModelImplCopyWith<_$IncomeModelImpl> get copyWith =>
      __$$IncomeModelImplCopyWithImpl<_$IncomeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncomeModelImplToJson(
      this,
    );
  }
}

abstract class _IncomeModel implements IncomeModel {
  const factory _IncomeModel(
      {final String id,
      final String title,
      final int amount,
      @JsonKey(name: 'spending_id') final String spendingId,
      @JsonKey(name: 'user_id') final String userId,
      @JsonKey(name: 'created_at') final String createdAt}) = _$IncomeModelImpl;

  factory _IncomeModel.fromJson(Map<String, dynamic> json) =
      _$IncomeModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  int get amount;
  @override
  @JsonKey(name: 'spending_id')
  String get spendingId;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$IncomeModelImplCopyWith<_$IncomeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
