import 'package:recipes_app/src/model/repository/recipes_repositories/local_recipe_repository.dart';
import 'package:recipes_app/src/model/repository/recipes_repositories/recipes_repository.dart';

class RepositoryModule {
  static RecipesRepository? _recipesRepository;

  static RecipesRepository get recipesRepository {
    return _recipesRepository ?? LocalRecipesRepository();
  }
}