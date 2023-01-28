import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';

abstract class RecipesRepository{
  Future<List<RecipesCategory>> getRecipeCategories();
  Future<bool> addRecipeCategory({required RecipesCategory category});
}