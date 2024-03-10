// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConnectionState {
  Status get status => throw _privateConstructorUsedError;
  BuildContext? get context => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ConnectionStateCopyWith<ConnectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionStateCopyWith<$Res> {
  factory $ConnectionStateCopyWith(
          ConnectionState value, $Res Function(ConnectionState) then) =
      _$ConnectionStateCopyWithImpl<$Res, ConnectionState>;
  @useResult
  $Res call({Status status, BuildContext? context});
}

/// @nodoc
class _$ConnectionStateCopyWithImpl<$Res, $Val extends ConnectionState>
    implements $ConnectionStateCopyWith<$Res> {
  _$ConnectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConnectionInitialImplCopyWith<$Res>
    implements $ConnectionStateCopyWith<$Res> {
  factory _$$ConnectionInitialImplCopyWith(_$ConnectionInitialImpl value,
          $Res Function(_$ConnectionInitialImpl) then) =
      __$$ConnectionInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, BuildContext? context});
}

/// @nodoc
class __$$ConnectionInitialImplCopyWithImpl<$Res>
    extends _$ConnectionStateCopyWithImpl<$Res, _$ConnectionInitialImpl>
    implements _$$ConnectionInitialImplCopyWith<$Res> {
  __$$ConnectionInitialImplCopyWithImpl(_$ConnectionInitialImpl _value,
      $Res Function(_$ConnectionInitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? context = freezed,
  }) {
    return _then(_$ConnectionInitialImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      context: freezed == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext?,
    ));
  }
}

/// @nodoc

class _$ConnectionInitialImpl implements _ConnectionInitial {
  const _$ConnectionInitialImpl({this.status = Status.initial, this.context});

  @override
  @JsonKey()
  final Status status;
  @override
  final BuildContext? context;

  @override
  String toString() {
    return 'ConnectionState(status: $status, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionInitialImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionInitialImplCopyWith<_$ConnectionInitialImpl> get copyWith =>
      __$$ConnectionInitialImplCopyWithImpl<_$ConnectionInitialImpl>(
          this, _$identity);
}

abstract class _ConnectionInitial implements ConnectionState {
  const factory _ConnectionInitial(
      {final Status status,
      final BuildContext? context}) = _$ConnectionInitialImpl;

  @override
  Status get status;
  @override
  BuildContext? get context;
  @override
  @JsonKey(ignore: true)
  _$$ConnectionInitialImplCopyWith<_$ConnectionInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
