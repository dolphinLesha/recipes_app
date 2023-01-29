import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:recipes_app/src/model/models/user_info/user_info.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/repository/mixins/user_info_repo_mixin.dart';

abstract class UserAction {
  const UserAction();
}

class UserInitLoad extends ReduxAction<AppState> with UserInfoRepositoryMixin {

  @override
  Future<AppState?> reduce() async {
    print('here');
    final user = await userInfoRepository.getUser();
    print('user user $user');
    return state.copyWith.userState(
      userInfo: user,
    );
  }
}

class UserSaveUser extends ReduxAction<AppState> with UserInfoRepositoryMixin {
  final UserInfo userInfo;


  UserSaveUser(this.userInfo);

  @override
  Future<AppState?> reduce() async {
    await userInfoRepository.saveUser(userInfo);

    return state.copyWith.userState(
      userInfo: userInfo,
    );
  }
}