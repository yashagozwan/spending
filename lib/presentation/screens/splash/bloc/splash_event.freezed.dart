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
  BuildContext get context => throw _privateConstructorUsedError;
}

/// @nodoc

class _$SplashInitialImpl implements SplashInitial {
  const _$SplashInitialImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SplashEvent.initial(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashInitialImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);
}

abstract class SplashInitial implements SplashEvent {
  const factory SplashInitial({required final BuildContext context}) =
      _$SplashInitialImpl;

  @override
  BuildContext get context;
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
}

abstract class SplashStarted implements SplashEvent {
  const factory SplashStarted({required final BuildContext context}) =
      _$SplashStartedImpl;

  @override
  BuildContext get context;
}
