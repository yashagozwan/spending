// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpendingEvent {}

/// @nodoc

class _$SpendingInitialImpl implements SpendingInitial {
  const _$SpendingInitialImpl();

  @override
  String toString() {
    return 'SpendingEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SpendingInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SpendingInitial implements SpendingEvent {
  const factory SpendingInitial() = _$SpendingInitialImpl;
}

/// @nodoc

class _$SpendingStartedImpl implements SpendingStarted {
  const _$SpendingStartedImpl();

  @override
  String toString() {
    return 'SpendingEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SpendingStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SpendingStarted implements SpendingEvent {
  const factory SpendingStarted() = _$SpendingStartedImpl;
}

/// @nodoc

class _$SpendingSetIdImpl implements SpendingSetId {
  const _$SpendingSetIdImpl({required this.id, required this.context});

  @override
  final String id;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'SpendingEvent.setId(id: $id, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingSetIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, context);
}

abstract class SpendingSetId implements SpendingEvent {
  const factory SpendingSetId(
      {required final String id,
      required final BuildContext context}) = _$SpendingSetIdImpl;

  String get id;
  BuildContext get context;
}
