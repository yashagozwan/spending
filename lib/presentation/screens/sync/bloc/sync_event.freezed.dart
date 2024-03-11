// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SyncEvent {}

/// @nodoc

class _$SyncInitialImpl implements SyncInitial {
  const _$SyncInitialImpl();

  @override
  String toString() {
    return 'SyncEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SyncInitial implements SyncEvent {
  const factory SyncInitial() = _$SyncInitialImpl;
}

/// @nodoc

class _$SyncStartedImpl implements SyncStarted {
  const _$SyncStartedImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SyncEvent.started(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncStartedImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);
}

abstract class SyncStarted implements SyncEvent {
  const factory SyncStarted({required final BuildContext context}) =
      _$SyncStartedImpl;

  BuildContext get context;
}
