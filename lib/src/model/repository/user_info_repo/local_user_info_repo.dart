import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/sqlite/sqlite_config.dart';
import 'package:recipes_app/src/model/models/user_info/user_info.dart';
import 'package:recipes_app/src/model/repository/user_info_repo/user_info_repo.dart';

class LocalUserInfoRepo implements UserInfoRepository{
  @override
  Future<UserInfo?> getUser() async {
    final db = await DI.database;
    // await db.delete(SqliteConfig.userInfoTableName);
    final List<Map<String, dynamic>> users = await db.query(SqliteConfig.userInfoTableName);
    if (users.isEmpty){
      return null;
    }
    return UserInfo.fromJson(users.first);
  }

  @override
  Future<bool> saveUser(UserInfo userInfo) async {
    final db = await DI.database;
    await db.delete(SqliteConfig.userInfoTableName);
    await db.insert(SqliteConfig.userInfoTableName, userInfo.toJson());

    return true;
  }

}