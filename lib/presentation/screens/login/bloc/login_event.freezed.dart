// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginInitialImplCopyWith<$Res> {
  factory _$$LoginInitialImplCopyWith(
          _$LoginInitialImpl value, $Res Function(_$LoginInitialImpl) then) =
      __$$LoginInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInitialImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginInitialImpl>
    implements _$$LoginInitialImplCopyWith<$Res> {
  __$$LoginInitialImplCopyWithImpl(
      _$LoginInitialImpl _value, $Res Function(_$LoginInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginInitialImpl implements LoginInitial {
  const _$LoginInitialImpl();

  @override
  String toString() {
    return 'LoginEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LoginInitial implements LoginEvent {
  const factory LoginInitial() = _$LoginInitialImpl;
}

/// @nodoc
abstract class _$$LoginSignInWithGoogleImplCopyWith<$Res> {
  factory _$$LoginSignInWithGoogleImplCopyWith(
          _$LoginSignInWithGoogleImpl value,
          $Res Function(_$LoginSignInWithGoogleImpl) then) =
      __$$LoginSignInWithGoogleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$LoginSignInWithGoogleImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginSignInWithGoogleImpl>
    implements _$$LoginSignInWithGoogleImplCopyWith<$Res> {
  __$$LoginSignInWithGoogleImplCopyWithImpl(_$LoginSignInWithGoogleImpl _value,
      $Res Function(_$LoginSignInWithGoogleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$LoginSignInWithGoogleImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$LoginSignInWithGoogleImpl implements LoginSignInWithGoogle {
  const _$LoginSignInWithGoogleImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'LoginEvent.signInWithGoogle(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginSignInWithGoogleImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginSignInWithGoogleImplCopyWith<_$LoginSignInWithGoogleImpl>
      get copyWith => __$$LoginSignInWithGoogleImplCopyWithImpl<
          _$LoginSignInWithGoogleImpl>(this, _$identity);
}

abstract class LoginSignInWithGoogle implements LoginEvent {
  const factory LoginSignInWithGoogle({required final BuildContext context}) =
      _$LoginSignInWithGoogleImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$LoginSignInWithGoogleImplCopyWith<_$LoginSignInWithGoogleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginSignOutImplCopyWith<$Res> {
  factory _$$LoginSignOutImplCopyWith(
          _$LoginSignOutImpl value, $Res Function(_$LoginSignOutImpl) then) =
      __$$LoginSignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSignOutImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginSignOutImpl>
    implements _$$LoginSignOutImplCopyWith<$Res> {
  __$$LoginSignOutImplCopyWithImpl(
      _$LoginSignOutImpl _value, $Res Function(_$LoginSignOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginSignOutImpl implements LoginSignOut {
  const _$LoginSignOutImpl();

  @override
  String toString() {
    return 'LoginEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LoginSignOut implements LoginEvent {
  const factory LoginSignOut() = _$LoginSignOutImpl;
}
