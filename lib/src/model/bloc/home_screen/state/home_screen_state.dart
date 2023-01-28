import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';

part 'home_screen_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default([]) List<RecipesCategory> recipesCategories,
    @Default(FormStage.initial) FormStage formStage,
  }) = _HomeScreenState;
}