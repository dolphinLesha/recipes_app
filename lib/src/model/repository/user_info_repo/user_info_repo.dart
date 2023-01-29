import 'package:recipes_app/src/model/models/user_info/user_info.dart';

abstract class UserInfoRepository{
  Future<UserInfo?> getUser();
  Future<bool> saveUser(UserInfo userInfo);
}