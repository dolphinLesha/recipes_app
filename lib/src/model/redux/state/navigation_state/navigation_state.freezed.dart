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
  @JsonKey()
  RoutePath get currentRoute => throw _privateConstructorUsedError;
  List<IconData>? get navigationIcons => throw _privateConstructorUsedError;

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
      {@JsonKey() RoutePath currentRoute, List<IconData>? navigationIcons});
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
    Object? navigationIcons = freezed,
  }) {
    return _then(_value.copyWith(
      currentRoute: currentRoute == freezed
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as RoutePath,
      navigationIcons: navigationIcons == freezed
          ? _value.navigationIcons
          : navigationIcons // ignore: cast_nullable_to_non_nullable
              as List<IconData>?,
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
      {@JsonKey() RoutePath currentRoute, List<IconData>? navigationIcons});
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
    Object? navigationIcons = freezed,
  }) {
    return _then(_$_NavigationState(
      currentRoute: currentRoute == freezed
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as RoutePath,
      navigationIcons: navigationIcons == freezed
          ? _value._navigationIcons
          : navigationIcons // ignore: cast_nullable_to_non_nullable
              as List<IconData>?,
    ));
  }
}

/// @nodoc

class _$_NavigationState implements _NavigationState {
  const _$_NavigationState(
      {@JsonKey() this.currentRoute = const RouteHome(),
      final List<IconData>? navigationIcons})
      : _navigationIcons = navigationIcons;

  @override
  @JsonKey()
  final RoutePath currentRoute;
  final List<IconData>? _navigationIcons;
  @override
  List<IconData>? get navigationIcons {
    final value = _navigationIcons;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NavigationState(currentRoute: $currentRoute, navigationIcons: $navigationIcons)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavigationState &&
            const DeepCollectionEquality()
                .equals(other.currentRoute, currentRoute) &&
            const DeepCollectionEquality()
                .equals(other._navigationIcons, _navigationIcons));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentRoute),
      const DeepCollectionEquality().hash(_navigationIcons));

  @JsonKey(ignore: true)
  @override
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      __$$_NavigationStateCopyWithImpl<_$_NavigationState>(this, _$identity);
}

abstract class _NavigationState implements NavigationState {
  const factory _NavigationState(
      {@JsonKey() final RoutePath currentRoute,
      final List<IconData>? navigationIcons}) = _$_NavigationState;

  @override
  @JsonKey()
  RoutePath get currentRoute;
  @override
  List<IconData>? get navigationIcons;
  @override
  @JsonKey(ignore: true)
  _$$_NavigationStateCopyWith<_$_NavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}
