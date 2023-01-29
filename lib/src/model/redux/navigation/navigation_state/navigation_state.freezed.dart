// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NavigationState {
  RoutePath get currentRoute => throw _privateConstructorUsedError;
  AppNavigationCategory? get navigationCategory =>
      throw _privateConstructorUsedError;
  List<IconData>? get navigationIcons => throw _privateConstructorUsedError;
  Map<AppNavigationCategory, List<RoutePath>> get navigationHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavigationStateCopyWith<NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationStateCopyWith<$Res> {
  factory $NavigationStateCopyWith(
          NavigationState value, $Res Function(NavigationState) then) =
      _$NavigationStateCopyWithImpl<$Res>;
  $Res call(
      {RoutePath currentRoute,
      AppNavigationCategory? navigationCategory,
      List<IconData>? navigationIcons,
      Map<AppNavigationCategory, List<RoutePath>> navigationHistory});
}

/// @nodoc
class _$NavigationStateCopyWithImpl<$Res>
    implements $NavigationStateCopyWith<$Res> {
  _$NavigationStateCopyWithImpl(this._value, this._then);

  final NavigationState _value;
  // ignore: unused_field
  final $Res Function(NavigationState) _then;

  @override
  $Res call({
    Object? currentRoute = freezed,
    Object? navigationCategory = freezed,
    Object? navigationIcons = freezed,
    Object? navigationHistory = freezed,
  }) {
    return _then(_value.copyWith(
      currentRoute: currentRoute == freezed
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as RoutePath,
      navigationCategory: navigationCategory == freezed
          ? _value.navigationCategory
          : navigationCategory // ignore: cast_nullable_to_non_nullable
              as AppNavigationCategory?,
      navigationIcons: navigationIcons == freezed
          ? _value.navigationIcons
          : navigationIcons // ignore: cast_nullable_to_non_nullable
              as List<IconData>?,
      navigationHistory: navigationHistory == freezed
          ? _value.navigationHistory
          : navigationHistory // ignore: cast_nullable_to_non_nullable
              as Map<AppNavigationCategory, List<RoutePath>>,
    ));
  }
}

/// @nodoc
abstract class _$$_NavigationStateCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$$_NavigationStateCopyWith(
          _$_NavigationState value, $Res Function(_$_NavigationState) then) =
      __$$_NavigationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {RoutePath currentRoute,
      AppNavigationCategory? navigationCategory,
      List<IconData>? navigationIcons,
      Map<AppNavigationCategory, List<RoutePath>> navigationHistory});
}

/// @nodoc
class __$$_NavigationStateCopyWithImpl<$Res>
    extends _$NavigationStateCopyWithImpl<$Res>
    implements _$$_NavigationStateCopyWith<$Res> {
  __$$_NavigationStateCopyWithImpl(
      _$_NavigationState _value, $Res Function(_$_NavigationState) _then)
      : super(_value, (v) => _then(v as _$_NavigationState));

  @override
  _$_NavigationState get _value => super._value as _$_NavigationState;

  @override
  $Res call({
    Object? currentRoute = freezed,
    Object? navigationCategory = freezed,
    Object? navigationIcons = freezed,
    Object? navigationHistory = freezed,
  }) {
    return _then(_$_NavigationState(
      currentRoute: currentRoute == freezed
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as RoutePath,
      navigationCategory: navigationCategory == freezed
          ? _value.navigationCategory
          : navigationCategory // ignore: cast_nullable_to_non_nullable
              as AppNavigationCategory?,
      navigationIcons: navigationIcons == freezed
          ? _value._navigationIcons
          : navigationIcons // ignore: cast_nullable_to_non_nullable
              as List<IconData>?,
      navigationHistory: navigationHistory == freezed
          ? _value._navigationHistory
          : navigationHistory // ignore: cast_nullable_to_non_nullable
              as Map<AppNavigationCategory, List<RoutePath>>,
    ));
  }
}

/// @nodoc

class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {this.currentRoute = const RouteWelcome(),
      this.navigationCategory,
      final List<IconData>? navigationIcons,
      required final Map<AppNavigationCategory, List<RoutePath>>
          navigationHistory})
      : _navigationIcons = navigationIcons,
        _navigationHistory = navigationHistory;

  @override
  @JsonKey()
  final RoutePath currentRoute;
  @override
  final AppNavigationCategory? navigationCategory;
  final List<IconData>? _navigationIcons;
  @override
  List<IconData>? get navigationIcons {
    final value = _navigationIcons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<AppNavigationCategory, List<RoutePath>> _navigationHistory;
  @override
  Map<AppNavigationCategory, List<RoutePath>> get navigationHistory {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_navigationHistory);
  }

  @override
  String toString() {
    return 'NavigationState(currentRoute: $currentRoute, navigationCategory: $navigationCategory, navigationIcons: $navigationIcons, navigationHistory: $navigationHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationState &&
            const DeepCollectionEquality()
                .equals(other.currentRoute, currentRoute) &&
            const DeepCollectionEquality()
                .equals(other.navigationCategory, navigationCategory) &&
            const DeepCollectionEquality()
                .equals(other._navigationIcons, _navigationIcons) &&
            const DeepCollectionEquality()
                .equals(other._navigationHistory, _navigationHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentRoute),
      const DeepCollectionEquality().hash(navigationCategory),
      const DeepCollectionEquality().hash(_navigationIcons),
      const DeepCollectionEquality().hash(_navigationHistory));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      __$$_NavigationStateCopyWithImpl<_$_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {final RoutePath currentRoute,
      final AppNavigationCategory? navigationCategory,
      final List<IconData>? navigationIcons,
      required final Map<AppNavigationCategory, List<RoutePath>>
          navigationHistory}) = _$_NavigationState;

  @override
  RoutePath get currentRoute;
  @override
  AppNavigationCategory? get navigationCategory;
  @override
  List<IconData>? get navigationIcons;
  @override
  Map<AppNavigationCategory, List<RoutePath>> get navigationHistory;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
