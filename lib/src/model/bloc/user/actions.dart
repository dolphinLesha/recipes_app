import 'package:recipes_app/src/model/models/user_info/user_info.dart';

abstract class UserAction {
  const UserAction();
}

class UserInitLoad extends UserAction{
  const UserInitLoad();
}

class UserSave extends UserAction{
  final UserInfo userInfo;

  const UserSave(this.userInfo);
}