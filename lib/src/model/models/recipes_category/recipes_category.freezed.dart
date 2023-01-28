// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipes_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipesCategory _$RecipesCategoryFromJson(Map<String, dynamic> json) {
  return _RecipesCategory.fromJson(json);
}

/// @nodoc
mixin _$RecipesCategory {
  @JsonKey()
  String? get title => throw _privateConstructorUsedError;
  @JsonKey()
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipesCategoryCopyWith<RecipesCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesCategoryCopyWith<$Res> {
  factory $RecipesCategoryCopyWith(
          RecipesCategory value, $Res Function(RecipesCategory) then) =
      _$RecipesCategoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey() String? title, @JsonKey() @ColorConverter() Color? color});
}

/// @nodoc
class _$RecipesCategoryCopyWithImpl<$Res>
    implements $RecipesCategoryCopyWith<$Res> {
  _$RecipesCategoryCopyWithImpl(this._value, this._then);

  final RecipesCategory _value;
  // ignore: unused_field
  final $Res Function(RecipesCategory) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipesCategoryCopyWith<$Res>
    implements $RecipesCategoryCopyWith<$Res> {
  factory _$$_RecipesCategoryCopyWith(
          _$_RecipesCategory value, $Res Function(_$_RecipesCategory) then) =
      __$$_RecipesCategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey() String? title, @JsonKey() @ColorConverter() Color? color});
}

/// @nodoc
class __$$_RecipesCategoryCopyWithImpl<$Res>
    extends _$RecipesCategoryCopyWithImpl<$Res>
    implements _$$_RecipesCategoryCopyWith<$Res> {
  __$$_RecipesCategoryCopyWithImpl(
      _$_RecipesCategory _value, $Res Function(_$_RecipesCategory) _then)
      : super(_value, (v) => _then(v as _$_RecipesCategory));

  @override
  _$_RecipesCategory get _value => super._value as _$_RecipesCategory;

  @override
  $Res call({
    Object? title = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_RecipesCategory(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipesCategory implements _RecipesCategory {
  const _$_RecipesCategory(
      {@JsonKey() this.title, @JsonKey() @ColorConverter() this.color});

  factory _$_RecipesCategory.fromJson(Map<String, dynamic> json) =>
      _$$_RecipesCategoryFromJson(json);

  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  @ColorConverter()
  final Color? color;

  @override
  String toString() {
    return 'RecipesCategory(title: $title, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipesCategory &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_RecipesCategoryCopyWith<_$_RecipesCategory> get copyWith =>
      __$$_RecipesCategoryCopyWithImpl<_$_RecipesCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipesCategoryToJson(
      this,
    );
  }
}

abstract class _RecipesCategory implements RecipesCategory {
  const factory _RecipesCategory(
      {@JsonKey() final String? title,
      @JsonKey() @ColorConverter() final Color? color}) = _$_RecipesCategory;

  factory _RecipesCategory.fromJson(Map<String, dynamic> json) =
      _$_RecipesCategory.fromJson;

  @override
  @JsonKey()
  String? get title;
  @override
  @JsonKey()
  @ColorConverter()
  Color? get color;
  @override
  @JsonKey(ignore: true)
  _$$_RecipesCategoryCopyWith<_$_RecipesCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
