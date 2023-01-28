import 'package:recipes_app/src/model/repository/recipes_repositories/recipes_repository.dart';
import 'package:recipes_app/src/model/repository/repository_module.dart';

class RecipesRepositoryMixin {
  RecipesRepository get recipesRepository =>
      RepositoryModule.recipesRepository;
}