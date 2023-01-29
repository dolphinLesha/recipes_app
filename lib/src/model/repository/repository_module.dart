import 'package:recipes_app/src/model/repository/recipes_repositories/local_recipe_repository.dart';
import 'package:recipes_app/src/model/repository/recipes_repositories/recipes_repository.dart';
import 'package:recipes_app/src/model/repository/user_info_repo/local_user_info_repo.dart';
import 'package:recipes_app/src/model/repository/user_info_repo/user_info_repo.dart';

class RepositoryModule {
  static RecipesRepository? _recipesRepository;
  static UserInfoRepository? _userInfoRepository;

  static RecipesRepository get recipesRepository {
    return _recipesRepository ?? LocalRecipesRepository();
  }

  static UserInfoRepository get userInfoRepository {
    return _userInfoRepository ?? LocalUserInfoRepo();
  }
}