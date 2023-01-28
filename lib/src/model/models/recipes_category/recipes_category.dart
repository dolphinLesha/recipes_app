import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/presentation/core/styles/app_colors.dart';

part 'recipes_category.freezed.dart';

part 'recipes_category.g.dart';

@freezed
class RecipesCategory with _$RecipesCategory {
  const factory RecipesCategory({
    @JsonKey() String? title,
    @JsonKey() @ColorConverter() Color? color,
    // @JsonKey() @GradientConverter() Pair<Color, Color>? gradient,
  }) = _RecipesCategory;

factory RecipesCategory.fromJson(Map<String, dynamic> json) => _$RecipesCategoryFromJson(json);
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    return Color(int.parse(json));
  }

  @override
  String toJson(Color color) {
    return color.value.toString();
  }
}

class GradientConverter implements JsonConverter<Pair<Color, Color>, Map<String, dynamic>> {
  const GradientConverter();

  @override
  Pair<Color, Color> fromJson(Map<String, dynamic> json) {
    final color1 = Color(int.parse(json['color1'].toString()));
    final color2 = Color(int.parse(json['color2'].toString()));
    return Pair(color1, color2);
  }

  @override
  Map<String, dynamic> toJson(Pair<Color, Color> gradient) {
    return {
      'color1': gradient.l.value.toString(),
      'color2': gradient.r.value.toString(),
    };
  }
}