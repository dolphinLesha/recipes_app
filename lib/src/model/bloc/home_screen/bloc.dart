import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/bloc/home_screen/actions.dart';
import 'package:recipes_app/src/model/bloc/home_screen/state/home_screen_state.dart';
import 'package:recipes_app/src/model/repository/mixins/recipes_repository_mixin.dart';

class HomeScreenBloc extends Bloc<HomeScreenAction, HomeScreenState>
    with RecipesRepositoryMixin {

  HomeScreenBloc({
    HomeScreenState? initialState,
  }) : super(initialState ?? const HomeScreenState()) {
    on<HomeScreenInitLoad>(_initLoad);
    // on<HomeScreenLoaded>(_statsLoad);
  }

  void _initLoad (
      HomeScreenInitLoad event, Emitter<HomeScreenState> emit) async {
    emit(state.copyWith(formStage: FormStage.loading));

    try {
      final res = await recipesRepository.getRecipeCategories();
      emit(state.copyWith(formStage: FormStage.common, recipesCategories: res));
    } on Exception catch (e) {
      print(e.toString());
      emit(state.copyWith(formStage: FormStage.failed));
    }

  }


}
