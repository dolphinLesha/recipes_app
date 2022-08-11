// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  @JsonKey()
  NavigationState get navigationState => throw _privateConstructorUsedError;
  @JsonKey()
  ThemeState get themeState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() NavigationState navigationState,
      @JsonKey() ThemeState themeState});

  $NavigationStateCopyWith<$Res> get navigationState;
  $ThemeStateCopyWith<$Res> get themeState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? navigationState = freezed,
    Object? themeState = freezed,
  }) {
    return _then(_value.copyWith(
      navigationState: navigationState == freezed
          ? _value.navigationState
          : navigationState // ignore: cast_nullable_to_non_nullable
              as NavigationState,
      themeState: themeState == freezed
          ? _value.themeState
          : themeState // ignore: cast_nullable_to_non_nullable
              as ThemeState,
    ));
  }

  @override
  $NavigationStateCopyWith<$Res> get navigationState {
    return $NavigationStateCopyWith<$Res>(_value.navigationState, (value) {
      return _then(_value.copyWith(navigationState: value));
    });
  }

  @override
  $ThemeStateCopyWith<$Res> get themeState {
    return $ThemeStateCopyWith<$Res>(_value.themeState, (value) {
      return _then(_value.copyWith(themeState: value));
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() NavigationState navigationState,
      @JsonKey() ThemeState themeState});

  @override
  $NavigationStateCopyWith<$Res> get navigationState;
  @override
  $ThemeStateCopyWith<$Res> get themeState;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, (v) => _then(v as _$_AppState));

  @override
  _$_AppState get _value => super._value as _$_AppState;

  @override
  $Res call({
    Object? navigationState = freezed,
    Object? themeState = freezed,
  }) {
    return _then(_$_AppState(
      navigationState: navigationState == freezed
          ? _value.navigationState
          : navigationState // ignore: cast_nullable_to_non_nullable
              as NavigationState,
      themeState: themeState == freezed
          ? _value.themeState
          : themeState // ignore: cast_nullable_to_non_nullable
              as ThemeState,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  const _$_AppState(
      {@JsonKey() this.navigationState = const NavigationState(),
      @JsonKey() this.themeState = const ThemeState()});

  @override
  @JsonKey()
  final NavigationState navigationState;
  @override
  @JsonKey()
  final ThemeState themeState;

  @override
  String toString() {
    return 'AppState(navigationState: $navigationState, themeState: $themeState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            const DeepCollectionEquality()
                .equals(other.navigationState, navigationState) &&
            const DeepCollectionEquality()
                .equals(other.themeState, themeState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(navigationState),
      const DeepCollectionEquality().hash(themeState));

  @JsonKey(ignore: true)
  @override
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {@JsonKey() final NavigationState navigationState,
      @JsonKey() final ThemeState themeState}) = _$_AppState;

  @override
  @JsonKey()
  NavigationState get navigationState;
  @override
  @JsonKey()
  ThemeState get themeState;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
