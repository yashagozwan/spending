// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {}

/// @nodoc

class _$HomeInitialImpl implements HomeInitial {
  const _$HomeInitialImpl();

  @override
  String toString() {
    return 'HomeEvent.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class HomeInitial implements HomeEvent {
  const factory HomeInitial() = _$HomeInitialImpl;
}

/// @nodoc

class _$HomeStartedImpl implements HomeStarted {
  const _$HomeStartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class HomeStarted implements HomeEvent {
  const factory HomeStarted() = _$HomeStartedImpl;
}

/// @nodoc

class _$HomeLogoutImpl implements HomeLogout {
  const _$HomeLogoutImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'HomeEvent.logout(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLogoutImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);
}

abstract class HomeLogout implements HomeEvent {
  const factory HomeLogout({required final BuildContext context}) =
      _$HomeLogoutImpl;

  BuildContext get context;
}

/// @nodoc

class _$HomeShowUserDetailBottomSheetImpl
    implements HomeShowUserDetailBottomSheet {
  const _$HomeShowUserDetailBottomSheetImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'HomeEvent.showUserDetailBottomSheet(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShowUserDetailBottomSheetImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);
}

abstract class HomeShowUserDetailBottomSheet implements HomeEvent {
  const factory HomeShowUserDetailBottomSheet(
          {required final BuildContext context}) =
      _$HomeShowUserDetailBottomSheetImpl;

  BuildContext get context;
}

/// @nodoc

class _$HomeCreateReportImpl implements HomeCreateReport {
  const _$HomeCreateReportImpl();

  @override
  String toString() {
    return 'HomeEvent.createReport()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HomeCreateReportImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class HomeCreateReport implements HomeEvent {
  const factory HomeCreateReport() = _$HomeCreateReportImpl;
}
