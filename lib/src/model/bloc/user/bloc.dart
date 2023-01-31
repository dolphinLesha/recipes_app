import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/model/bloc/user/actions.dart';
import 'package:recipes_app/src/model/bloc/user/state/user_state.dart';
import 'package:recipes_app/src/model/repository/mixins/user_info_repo_mixin.dart';
export 'actions.dart';

class UserBloc extends Bloc<UserAction, UserState> with UserInfoRepositoryMixin{

  static final UserBloc _bloc = UserBloc._internal();

  UserBloc._internal() : super(const UserState(
  )) {
    on<UserInitLoad>(_initLoad);
    on<UserSave>(_saveUser);
  }

  factory UserBloc() {
    return _bloc;
  }

  void _initLoad (
      UserInitLoad event, Emitter<UserState> emit) async {
    final user = await userInfoRepository.getUser();
    emit(state.copyWith(
      userInfo: user,
    ));
  }

  void _saveUser (
      UserSave event, Emitter<UserState> emit) async {
    await userInfoRepository.saveUser(event.userInfo);
    emit(state.copyWith(
      userInfo: event.userInfo,
    ));
  }


}