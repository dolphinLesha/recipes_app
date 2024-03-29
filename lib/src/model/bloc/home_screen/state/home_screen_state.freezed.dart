// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenState {
  List<RecipesCategory> get recipesCategories =>
      throw _privateConstructorUsedError;
  FormStage get formStage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeScreenStateCopyWith<HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
  $Res call({List<RecipesCategory> recipesCategories, FormStage formStage});
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;

  @override
  $Res call({
    Object? recipesCategories = freezed,
    Object? formStage = freezed,
  }) {
    return _then(_value.copyWith(
      recipesCategories: recipesCategories == freezed
          ? _value.recipesCategories
          : recipesCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipesCategory>,
      formStage: formStage == freezed
          ? _value.formStage
          : formStage // ignore: cast_nullable_to_non_nullable
              as FormStage,
    ));
  }
}

/// @nodoc
abstract class _$$_HomeScreenStateCopyWith<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  factory _$$_HomeScreenStateCopyWith(
          _$_HomeScreenState value, $Res Function(_$_HomeScreenState) then) =
      __$$_HomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({List<RecipesCategory> recipesCategories, FormStage formStage});
}

/// @nodoc
class __$$_HomeScreenStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$$_HomeScreenStateCopyWith<$Res> {
  __$$_HomeScreenStateCopyWithImpl(
      _$_HomeScreenState _value, $Res Function(_$_HomeScreenState) _then)
      : super(_value, (v) => _then(v as _$_HomeScreenState));

  @override
  _$_HomeScreenState get _value => super._value as _$_HomeScreenState;

  @override
  $Res call({
    Object? recipesCategories = freezed,
    Object? formStage = freezed,
  }) {
    return _then(_$_HomeScreenState(
      recipesCategories: recipesCategories == freezed
          ? _value.recipesCategories
          : recipesCategories // ignore: cast_nullable_to_non_nullable
              as List<RecipesCategory>,
      formStage: formStage == freezed
          ? _value.formStage
          : formStage // ignore: cast_nullable_to_non_nullable
              as FormStage,
    ));
  }
}

/// @nodoc

class _$_HomeScreenState implements _HomeScreenState {
  const _$_HomeScreenState(
      {this.recipesCategories = const [], this.formStage = FormStage.initial});

  @override
  @JsonKey()
  final List<RecipesCategory> recipesCategories;
  @override
  @JsonKey()
  final FormStage formStage;

  @override
  String toString() {
    return 'HomeScreenState(recipesCategories: $recipesCategories, formStage: $formStage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeScreenState &&
            const DeepCollectionEquality()
                .equals(other.recipesCategories, recipesCategories) &&
            const DeepCollectionEquality().equals(other.formStage, formStage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(recipesCategories),
      const DeepCollectionEquality().hash(formStage));

  @JsonKey(ignore: true)
  @override
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      __$$_HomeScreenStateCopyWithImpl<_$_HomeScreenState>(this, _$identity);
}

abstract class _HomeScreenState implements HomeScreenState {
  const factory _HomeScreenState(
      {final List<RecipesCategory> recipesCategories,
      final FormStage formStage}) = _$_HomeScreenState;

  @override
  List<RecipesCategory> get recipesCategories;
  @override
  FormStage get formStage;
  @override
  @JsonKey(ignore: true)
  _$$_HomeScreenStateCopyWith<_$_HomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
