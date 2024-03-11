// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  Status get status => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  List<SpendingModel> get spendings => throw _privateConstructorUsedError;
  String get spendingTitle => throw _privateConstructorUsedError;
  String get dateIso => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {Status status,
      UserModel user,
      List<SpendingModel> spendings,
      String spendingTitle,
      String dateIso});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
    Object? spendings = null,
    Object? spendingTitle = null,
    Object? dateIso = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      spendings: null == spendings
          ? _value.spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as List<SpendingModel>,
      spendingTitle: null == spendingTitle
          ? _value.spendingTitle
          : spendingTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dateIso: null == dateIso
          ? _value.dateIso
          : dateIso // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status status,
      UserModel user,
      List<SpendingModel> spendings,
      String spendingTitle,
      String dateIso});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
    Object? spendings = null,
    Object? spendingTitle = null,
    Object? dateIso = null,
  }) {
    return _then(_$HomeStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      spendings: null == spendings
          ? _value._spendings
          : spendings // ignore: cast_nullable_to_non_nullable
              as List<SpendingModel>,
      spendingTitle: null == spendingTitle
          ? _value.spendingTitle
          : spendingTitle // ignore: cast_nullable_to_non_nullable
              as String,
      dateIso: null == dateIso
          ? _value.dateIso
          : dateIso // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {this.status = Status.initial,
      this.user = const UserModel(),
      final List<SpendingModel> spendings = const [],
      this.spendingTitle = '',
      this.dateIso = ''})
      : _spendings = spendings;

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final UserModel user;
  final List<SpendingModel> _spendings;
  @override
  @JsonKey()
  List<SpendingModel> get spendings {
    if (_spendings is EqualUnmodifiableListView) return _spendings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_spendings);
  }

  @override
  @JsonKey()
  final String spendingTitle;
  @override
  @JsonKey()
  final String dateIso;

  @override
  String toString() {
    return 'HomeState(status: $status, user: $user, spendings: $spendings, spendingTitle: $spendingTitle, dateIso: $dateIso)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._spendings, _spendings) &&
            (identical(other.spendingTitle, spendingTitle) ||
                other.spendingTitle == spendingTitle) &&
            (identical(other.dateIso, dateIso) || other.dateIso == dateIso));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user,
      const DeepCollectionEquality().hash(_spendings), spendingTitle, dateIso);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final Status status,
      final UserModel user,
      final List<SpendingModel> spendings,
      final String spendingTitle,
      final String dateIso}) = _$HomeStateImpl;

  @override
  Status get status;
  @override
  UserModel get user;
  @override
  List<SpendingModel> get spendings;
  @override
  String get spendingTitle;
  @override
  String get dateIso;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
