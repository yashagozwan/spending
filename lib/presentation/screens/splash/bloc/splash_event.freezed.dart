// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BuildContext context) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BuildContext context)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BuildContext context)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashStarted value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashInitial value)? initial,
    TResult? Function(SplashStarted value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashStarted value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res, SplashEvent>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SplashInitialImplCopyWith<$Res> {
  factory _$$SplashInitialImplCopyWith(
          _$SplashInitialImpl value, $Res Function(_$SplashInitialImpl) then) =
      __$$SplashInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashInitialImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$SplashInitialImpl>
    implements _$$SplashInitialImplCopyWith<$Res> {
  __$$SplashInitialImplCopyWithImpl(
      _$SplashInitialImpl _value, $Res Function(_$SplashInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SplashInitialImpl implements SplashInitial {
  const _$SplashInitialImpl();

  @override
  String toString() {
    return 'SplashEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BuildContext context) started,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BuildContext context)? started,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BuildContext context)? started,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashStarted value) started,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashInitial value)? initial,
    TResult? Function(SplashStarted value)? started,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashStarted value)? started,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SplashInitial implements SplashEvent {
  const factory SplashInitial() = _$SplashInitialImpl;
}

/// @nodoc
abstract class _$$SplashStartedImplCopyWith<$Res> {
  factory _$$SplashStartedImplCopyWith(
          _$SplashStartedImpl value, $Res Function(_$SplashStartedImpl) then) =
      __$$SplashStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$SplashStartedImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$SplashStartedImpl>
    implements _$$SplashStartedImplCopyWith<$Res> {
  __$$SplashStartedImplCopyWithImpl(
      _$SplashStartedImpl _value, $Res Function(_$SplashStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$SplashStartedImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$SplashStartedImpl implements SplashStarted {
  const _$SplashStartedImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SplashEvent.started(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStartedImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStartedImplCopyWith<_$SplashStartedImpl> get copyWith =>
      __$$SplashStartedImplCopyWithImpl<_$SplashStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BuildContext context) started,
  }) {
    return started(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BuildContext context)? started,
  }) {
    return started?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BuildContext context)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashInitial value) initial,
    required TResult Function(SplashStarted value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashInitial value)? initial,
    TResult? Function(SplashStarted value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashInitial value)? initial,
    TResult Function(SplashStarted value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class SplashStarted implements SplashEvent {
  const factory SplashStarted({required final BuildContext context}) =
      _$SplashStartedImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$SplashStartedImplCopyWith<_$SplashStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
