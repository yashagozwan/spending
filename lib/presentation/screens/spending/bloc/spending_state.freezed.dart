// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpendingState {
  Status get status => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  SpendingModel get spending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SpendingStateCopyWith<SpendingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingStateCopyWith<$Res> {
  factory $SpendingStateCopyWith(
          SpendingState value, $Res Function(SpendingState) then) =
      _$SpendingStateCopyWithImpl<$Res, SpendingState>;
  @useResult
  $Res call({Status status, String id, SpendingModel spending});

  $SpendingModelCopyWith<$Res> get spending;
}

/// @nodoc
class _$SpendingStateCopyWithImpl<$Res, $Val extends SpendingState>
    implements $SpendingStateCopyWith<$Res> {
  _$SpendingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? spending = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spending: null == spending
          ? _value.spending
          : spending // ignore: cast_nullable_to_non_nullable
              as SpendingModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpendingModelCopyWith<$Res> get spending {
    return $SpendingModelCopyWith<$Res>(_value.spending, (value) {
      return _then(_value.copyWith(spending: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpendingStateImplCopyWith<$Res>
    implements $SpendingStateCopyWith<$Res> {
  factory _$$SpendingStateImplCopyWith(
          _$SpendingStateImpl value, $Res Function(_$SpendingStateImpl) then) =
      __$$SpendingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String id, SpendingModel spending});

  @override
  $SpendingModelCopyWith<$Res> get spending;
}

/// @nodoc
class __$$SpendingStateImplCopyWithImpl<$Res>
    extends _$SpendingStateCopyWithImpl<$Res, _$SpendingStateImpl>
    implements _$$SpendingStateImplCopyWith<$Res> {
  __$$SpendingStateImplCopyWithImpl(
      _$SpendingStateImpl _value, $Res Function(_$SpendingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = null,
    Object? spending = null,
  }) {
    return _then(_$SpendingStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      spending: null == spending
          ? _value.spending
          : spending // ignore: cast_nullable_to_non_nullable
              as SpendingModel,
    ));
  }
}

/// @nodoc

class _$SpendingStateImpl implements _SpendingState {
  const _$SpendingStateImpl(
      {this.status = Status.initial,
      this.id = '',
      this.spending = const SpendingModel()});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final SpendingModel spending;

  @override
  String toString() {
    return 'SpendingState(status: $status, id: $id, spending: $spending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.spending, spending) ||
                other.spending == spending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, id, spending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingStateImplCopyWith<_$SpendingStateImpl> get copyWith =>
      __$$SpendingStateImplCopyWithImpl<_$SpendingStateImpl>(this, _$identity);
}

abstract class _SpendingState implements SpendingState {
  const factory _SpendingState(
      {final Status status,
      final String id,
      final SpendingModel spending}) = _$SpendingStateImpl;

  @override
  Status get status;
  @override
  String get id;
  @override
  SpendingModel get spending;
  @override
  @JsonKey(ignore: true)
  _$$SpendingStateImplCopyWith<_$SpendingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
