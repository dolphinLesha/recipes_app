import 'package:recipes_app/src/model/repository/repository_module.dart';
import 'package:recipes_app/src/model/repository/user_info_repo/user_info_repo.dart';

class UserInfoRepositoryMixin {
  UserInfoRepository get userInfoRepository =>
      RepositoryModule.userInfoRepository;
}