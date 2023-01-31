import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/models/user_info/user_info.dart';

part 'user_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UserState with _$UserState {
  const factory UserState({
    UserInfo? userInfo,
  }) = _UserState;
}