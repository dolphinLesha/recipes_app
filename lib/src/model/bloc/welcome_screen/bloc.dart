import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/bloc/navigation/actions.dart';
import 'package:recipes_app/src/model/bloc/user/actions.dart';
import 'package:recipes_app/src/model/bloc/welcome_screen/actions.dart';
import 'package:recipes_app/src/model/bloc/Welcome_screen/state/welcome_screen_state.dart';
import 'package:recipes_app/src/model/models/user_info/user_info.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
export 'package:recipes_app/src/model/bloc/Welcome_screen/state/welcome_screen_state.dart';

class WelcomeScreenBloc extends Bloc<WelcomeScreenAction, WelcomeScreenState> {
  WelcomeScreenBloc({
    WelcomeScreenState? initialState,
  }) : super(initialState ?? const WelcomeScreenState()) {
    on<WelcomeScreenInitLoad>(_initLoad);
    on<WelcomeScreenFirstNameChanged>(_firstNameChanged);
    on<WelcomeScreenLastNameChanged>(_lastNameChanged);
    on<WelcomeScreenConfirmRegister>(_confirmRegister);
  }

  void _initLoad(
      WelcomeScreenInitLoad event, Emitter<WelcomeScreenState> emit) async {
    emit(state.copyWith(formStage: FormStage.loading));
    await Future.delayed(const Duration(seconds: 2));
    try {
      final user = DI.userBloc.state.userInfo;
      if (user!=null){
        DI.navigationBloc.add(RouteChanged(category: AppNavigationCategory.home));
      }
      emit(state.copyWith(
        formStage: FormStage.common,
      ));
    } on Exception catch (e) {
      print(e.toString());
      emit(state.copyWith(
        formStage: FormStage.failed,
      ));
    }
  }

  void _confirmRegister(WelcomeScreenConfirmRegister event,
      Emitter<WelcomeScreenState> emit) async {
    emit(state.copyWith(formStage: FormStage.loading));
    await Future.delayed(const Duration(seconds: 2));
    UserInfo user = UserInfo(
      firstName: state.firstName,
      lastName: state.lastName,
    );
    try {
      DI.userBloc.add(UserSave(user));
      DI.navigationBloc.add(RouteChanged(category: AppNavigationCategory.home));
    } on Exception catch (e) {
      print(e.toString());
      emit(state.copyWith(
        formStage: FormStage.failed,
      ));
    }
  }

  void _firstNameChanged(WelcomeScreenFirstNameChanged event,
      Emitter<WelcomeScreenState> emit) async {
    bool valid = false;
    if (event.text.isNotEmpty && state.lastName.isNotEmpty) {
      valid = true;
    }
    emit(state.copyWith(
      firstName: event.text,
      validToEnter: valid,
    ));
  }

  void _lastNameChanged(WelcomeScreenLastNameChanged event,
      Emitter<WelcomeScreenState> emit) async {
    bool valid = false;
    if (event.text.isNotEmpty && state.firstName.isNotEmpty) {
      valid = true;
    }
    emit(state.copyWith(
      lastName: event.text,
      validToEnter: valid,
    ));
  }
}
