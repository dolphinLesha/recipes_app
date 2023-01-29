import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';

part 'welcome_screen_state.freezed.dart';

// @Freezed(makeCollectionsUnmodifiable: false)

@freezed
class WelcomeScreenState with _$WelcomeScreenState {
  const factory WelcomeScreenState({
    @Default(FormStage.loading) FormStage formStage,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default(false) bool validToEnter,
  }) = _WelcomeScreenState;
}