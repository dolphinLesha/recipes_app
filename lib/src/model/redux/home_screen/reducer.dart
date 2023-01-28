// import 'dart:async';
//
// import 'package:recipes_app/src/data/common/enums/form_stage.dart';
// import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';
// import 'package:recipes_app/src/model/bloc/home_screen/actions.dart';
// import 'package:recipes_app/src/model/redux/home_screen/state/home_screen_state.dart';
// import 'package:recipes_app/src/model/redux/state/app_state/app_state.dart';
// import 'package:recipes_app/src/model/repository/mixins/recipes_repository_mixin.dart';
// import 'package:redux/redux.dart';
// import 'package:redux_thunk/redux_thunk.dart';
//
// class HomeScreenReducer {
//   static final reducer = combineReducers<AppState>([
//     // TypedReducer<HomeScreenState, HomeScreenInitLoad>(HomeScreenReducer._onInitLoad),
//     TypedReducer<AppState, HomeScreenLoading>(
//         HomeScreenReducer._onLoading),
//     TypedReducer<AppState, HomeScreenLoaded>(
//         HomeScreenReducer._onLoaded),
//     TypedReducer<AppState, HomeScreenFailedLoad>(
//         HomeScreenReducer._onFailedLoad),
//   ]);
//
//   // static HomeScreenState _onInitLoad(HomeScreenState state, HomeScreenInitLoad action) async {
//   //
//   // }
//
//   static AppState _onLoading(
//       AppState state, HomeScreenLoading action) {
//     return state.copyWith.homeScreenState(formStage: FormStage.loading);
//   }
//
//   static AppState _onLoaded(
//       AppState state, HomeScreenLoaded action) {
//     return state.copyWith.homeScreenState(
//         formStage: FormStage.common,
//         recipesCategories: action.recipeCategories);
//   }
//
//   static AppState _onFailedLoad(
//       AppState state, HomeScreenFailedLoad action) {
//     return state.copyWith.homeScreenState(
//       formStage: FormStage.failed,
//     );
//   }
// }
//
// class InitLoadHomeScreen extends CallableThunkAction<AppState>
//     with RecipesRepositoryMixin {
//   InitLoadHomeScreen();
//
//   @override
//   void call(Store<AppState> store) async {
//     store.dispatch(const HomeScreenLoading());
//
//     try {
//       final res = await _loadRecipesCategories();
//       store.dispatch(HomeScreenLoaded(recipeCategories: res));
//     } on Exception catch (e) {
//       print(e.toString());
//       store.dispatch(const HomeScreenFailedLoad());
//     }
//   }
//
//   Future<List<RecipesCategory>> _loadRecipesCategories() async {
//     return await recipesRepository.getRecipeCategories();
//   }
// }
