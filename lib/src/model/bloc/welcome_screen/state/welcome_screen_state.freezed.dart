// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'welcome_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WelcomeScreenState {
  FormStage get formStage => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  bool get validToEnter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WelcomeScreenStateCopyWith<WelcomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeScreenStateCopyWith<$Res> {
  factory $WelcomeScreenStateCopyWith(
          WelcomeScreenState value, $Res Function(WelcomeScreenState) then) =
      _$WelcomeScreenStateCopyWithImpl<$Res>;
  $Res call(
      {FormStage formStage,
      String firstName,
      String lastName,
      bool validToEnter});
}

/// @nodoc
class _$WelcomeScreenStateCopyWithImpl<$Res>
    implements $WelcomeScreenStateCopyWith<$Res> {
  _$WelcomeScreenStateCopyWithImpl(this._value, this._then);

  final WelcomeScreenState _value;
  // ignore: unused_field
  final $Res Function(WelcomeScreenState) _then;

  @override
  $Res call({
    Object? formStage = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? validToEnter = freezed,
  }) {
    return _then(_value.copyWith(
      formStage: formStage == freezed
          ? _value.formStage
          : formStage // ignore: cast_nullable_to_non_nullable
              as FormStage,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      validToEnter: validToEnter == freezed
          ? _value.validToEnter
          : validToEnter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_WelcomeScreenStateCopyWith<$Res>
    implements $WelcomeScreenStateCopyWith<$Res> {
  factory _$$_WelcomeScreenStateCopyWith(_$_WelcomeScreenState value,
          $Res Function(_$_WelcomeScreenState) then) =
      __$$_WelcomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {FormStage formStage,
      String firstName,
      String lastName,
      bool validToEnter});
}

/// @nodoc
class __$$_WelcomeScreenStateCopyWithImpl<$Res>
    extends _$WelcomeScreenStateCopyWithImpl<$Res>
    implements _$$_WelcomeScreenStateCopyWith<$Res> {
  __$$_WelcomeScreenStateCopyWithImpl(
      _$_WelcomeScreenState _value, $Res Function(_$_WelcomeScreenState) _then)
      : super(_value, (v) => _then(v as _$_WelcomeScreenState));

  @override
  _$_WelcomeScreenState get _value => super._value as _$_WelcomeScreenState;

  @override
  $Res call({
    Object? formStage = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? validToEnter = freezed,
  }) {
    return _then(_$_WelcomeScreenState(
      formStage: formStage == freezed
          ? _value.formStage
          : formStage // ignore: cast_nullable_to_non_nullable
              as FormStage,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      validToEnter: validToEnter == freezed
          ? _value.validToEnter
          : validToEnter // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WelcomeScreenState implements _WelcomeScreenState {
  const _$_WelcomeScreenState(
      {this.formStage = FormStage.loading,
      this.firstName = '',
      this.lastName = '',
      this.validToEnter = false});

  @override
  @JsonKey()
  final FormStage formStage;
  @override
  @JsonKey()
  final String firstName;
  @override
  @JsonKey()
  final String lastName;
  @override
  @JsonKey()
  final bool validToEnter;

  @override
  String toString() {
    return 'WelcomeScreenState(formStage: $formStage, firstName: $firstName, lastName: $lastName, validToEnter: $validToEnter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WelcomeScreenState &&
            const DeepCollectionEquality().equals(other.formStage, formStage) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.validToEnter, validToEnter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(formStage),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(validToEnter));

  @JsonKey(ignore: true)
  @override
  _$$_WelcomeScreenStateCopyWith<_$_WelcomeScreenState> get copyWith =>
      __$$_WelcomeScreenStateCopyWithImpl<_$_WelcomeScreenState>(
          this, _$identity);
}

abstract class _WelcomeScreenState implements WelcomeScreenState {
  const factory _WelcomeScreenState(
      {final FormStage formStage,
      final String firstName,
      final String lastName,
      final bool validToEnter}) = _$_WelcomeScreenState;

  @override
  FormStage get formStage;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  bool get validToEnter;
  @override
  @JsonKey(ignore: true)
  _$$_WelcomeScreenStateCopyWith<_$_WelcomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
