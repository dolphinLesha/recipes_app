import 'package:flutter/material.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';

abstract class HomeScreenAction {
  const HomeScreenAction();
}

class HomeScreenInitLoad extends HomeScreenAction {

  const HomeScreenInitLoad();
}

class HomeScreenLoaded extends HomeScreenAction {
  final List<RecipesCategory> recipeCategories;

  const HomeScreenLoaded({required this.recipeCategories});
}

