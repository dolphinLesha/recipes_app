import 'dart:async';

import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/model/redux/app/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/user/actions.dart';
import 'package:redux/redux.dart';

// class UserReducer {
//   static final reducer = combineReducers<AppState>([
//     TypedReducer<AppState, UserInitLoad>(UserReducer._userInitLoad),
//   ]);
//
//   static FutureOr<AppState> _userInitLoad(AppState state, UserInitLoad action) async {
//     final db = await DI.database;
//
//
//     return state.copyWith.userState(
//       currentRoute: route,
//       navigationIcons: action.navigationIcons,
//       navigationCategory: category,
//       navigationHistory: history,
//     );
//   }
// }