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

class _$SpendingCreateExpanseImpl implements SpendingCreateExpanse {
  const _$SpendingCreateExpanseImpl();

  @override
  String toString() {
    return 'SpendingEvent.createExpanse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingCreateExpanseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class SpendingCreateExpanse implements SpendingEvent {
  const factory SpendingCreateExpanse() = _$SpendingCreateExpanseImpl;
}

/// @nodoc

class _$SpendingSetExpenseTitleImpl implements SpendingSetExpenseTitle {
  const _$SpendingSetExpenseTitleImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'SpendingEvent.setExpenseTitle(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingSetExpenseTitleImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

abstract class SpendingSetExpenseTitle implements SpendingEvent {
  const factory SpendingSetExpenseTitle({required final String value}) =
      _$SpendingSetExpenseTitleImpl;

  String get value;
}

/// @nodoc

class _$SpendingSetExpenseAmountImpl implements SpendingSetExpenseAmount {
  const _$SpendingSetExpenseAmountImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'SpendingEvent.setExpenseAmount(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingSetExpenseAmountImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);
}

abstract class SpendingSetExpenseAmount implements SpendingEvent {
  const factory SpendingSetExpenseAmount({required final String value}) =
      _$SpendingSetExpenseAmountImpl;

  String get value;
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

/// @nodoc

class _$SpendingShowCreateExpenseModalDialogImpl
    implements SpendingShowCreateExpenseModalDialog {
  const _$SpendingShowCreateExpenseModalDialogImpl(
      {required this.context,
      required this.titleController,
      required this.amountController});

  @override
  final BuildContext context;
  @override
  final TextEditingController titleController;
  @override
  final TextEditingController amountController;

  @override
  String toString() {
    return 'SpendingEvent.showCreateExpenseBottomSheet(context: $context, titleController: $titleController, amountController: $amountController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingShowCreateExpenseModalDialogImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.titleController, titleController) ||
                other.titleController == titleController) &&
            (identical(other.amountController, amountController) ||
                other.amountController == amountController));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, titleController, amountController);
}

abstract class SpendingShowCreateExpenseModalDialog implements SpendingEvent {
  const factory SpendingShowCreateExpenseModalDialog(
          {required final BuildContext context,
          required final TextEditingController titleController,
          required final TextEditingController amountController}) =
      _$SpendingShowCreateExpenseModalDialogImpl;

  BuildContext get context;
  TextEditingController get titleController;
  TextEditingController get amountController;
}
