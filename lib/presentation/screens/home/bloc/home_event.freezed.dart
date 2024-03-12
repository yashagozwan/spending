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

/// @nodoc

class _$HomeUpdateReportImpl implements HomeUpdateReport {
  const _$HomeUpdateReportImpl({required this.spending});

  @override
  final SpendingModel spending;

  @override
  String toString() {
    return 'HomeEvent.updateReport(spending: $spending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeUpdateReportImpl &&
            (identical(other.spending, spending) ||
                other.spending == spending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spending);
}

abstract class HomeUpdateReport implements HomeEvent {
  const factory HomeUpdateReport({required final SpendingModel spending}) =
      _$HomeUpdateReportImpl;

  SpendingModel get spending;
}

/// @nodoc

class _$HomeSetSpendingTitleImpl implements HomeSetSpendingTitle {
  const _$HomeSetSpendingTitleImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'HomeEvent.setSpendingTitle(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSetSpendingTitleImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

abstract class HomeSetSpendingTitle implements HomeEvent {
  const factory HomeSetSpendingTitle({required final String value}) =
      _$HomeSetSpendingTitleImpl;

  String get value;
}

/// @nodoc

class _$HomeSetDateIsoImpl implements HomeSetDateIso {
  const _$HomeSetDateIsoImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'HomeEvent.setDateIso(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSetDateIsoImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

abstract class HomeSetDateIso implements HomeEvent {
  const factory HomeSetDateIso({required final String value}) =
      _$HomeSetDateIsoImpl;

  String get value;
}

/// @nodoc

class _$HomeShowCreateReportBottomSheetImpl
    implements HomeShowCreateReportBottomSheet {
  const _$HomeShowCreateReportBottomSheetImpl(
      {required this.context,
      required this.titleController,
      required this.dateController,
      required this.datePreviewController,
      this.isUpdate = false,
      this.spending});

  @override
  final BuildContext context;
  @override
  final TextEditingController titleController;
  @override
  final TextEditingController dateController;
  @override
  final TextEditingController datePreviewController;
  @override
  @JsonKey()
  final bool isUpdate;
  @override
  final SpendingModel? spending;

  @override
  String toString() {
    return 'HomeEvent.showCreateReportBottomSheet(context: $context, titleController: $titleController, dateController: $dateController, datePreviewController: $datePreviewController, isUpdate: $isUpdate, spending: $spending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShowCreateReportBottomSheetImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.titleController, titleController) ||
                other.titleController == titleController) &&
            (identical(other.dateController, dateController) ||
                other.dateController == dateController) &&
            (identical(other.datePreviewController, datePreviewController) ||
                other.datePreviewController == datePreviewController) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.spending, spending) ||
                other.spending == spending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, titleController,
      dateController, datePreviewController, isUpdate, spending);
}

abstract class HomeShowCreateReportBottomSheet implements HomeEvent {
  const factory HomeShowCreateReportBottomSheet(
      {required final BuildContext context,
      required final TextEditingController titleController,
      required final TextEditingController dateController,
      required final TextEditingController datePreviewController,
      final bool isUpdate,
      final SpendingModel? spending}) = _$HomeShowCreateReportBottomSheetImpl;

  BuildContext get context;
  TextEditingController get titleController;
  TextEditingController get dateController;
  TextEditingController get datePreviewController;
  bool get isUpdate;
  SpendingModel? get spending;
}

/// @nodoc

class _$HomeRemoveShowAlertDialogImpl implements HomeRemoveShowAlertDialog {
  const _$HomeRemoveShowAlertDialogImpl(
      {required this.context, required this.spending});

  @override
  final BuildContext context;
  @override
  final SpendingModel spending;

  @override
  String toString() {
    return 'HomeEvent.showRemoveAlertDialog(context: $context, spending: $spending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeRemoveShowAlertDialogImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.spending, spending) ||
                other.spending == spending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, spending);
}

abstract class HomeRemoveShowAlertDialog implements HomeEvent {
  const factory HomeRemoveShowAlertDialog(
      {required final BuildContext context,
      required final SpendingModel spending}) = _$HomeRemoveShowAlertDialogImpl;

  BuildContext get context;
  SpendingModel get spending;
}

/// @nodoc

class _$HomeRemoveSpendingImpl implements HomeRemoveSpending {
  const _$HomeRemoveSpendingImpl({required this.spending});

  @override
  final SpendingModel spending;

  @override
  String toString() {
    return 'HomeEvent.removeSpending(spending: $spending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeRemoveSpendingImpl &&
            (identical(other.spending, spending) ||
                other.spending == spending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spending);
}

abstract class HomeRemoveSpending implements HomeEvent {
  const factory HomeRemoveSpending({required final SpendingModel spending}) =
      _$HomeRemoveSpendingImpl;

  SpendingModel get spending;
}
