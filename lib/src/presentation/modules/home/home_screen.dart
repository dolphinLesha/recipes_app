import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/common/classes/pair.dart';
import 'package:recipes_app/src/data/common/enums/form_stage.dart';
import 'package:recipes_app/src/model/bloc/home_screen/bloc.dart';
import 'package:recipes_app/src/model/bloc/home_screen/state/home_screen_state.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';
import 'package:recipes_app/src/model/bloc/home_screen/actions.dart';
import 'package:recipes_app/src/model/redux/home_screen/reducer.dart';
import 'package:recipes_app/src/model/redux/state/app_state/app_state.dart';
import 'package:recipes_app/src/presentation/common/inputs/date_range_picker.dart';
import 'package:recipes_app/src/presentation/core/styles/app_typography.dart';
import 'package:recipes_app/src/presentation/modules/navigation_bar/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      material: (_, __) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: DI.store.state.themeState.currentTheme?.canvasColor,
          ),
          child: AppNavigationBar(
            child: BlocProvider<HomeScreenBloc>(
              create: (context) =>
                  HomeScreenBloc()..add(const HomeScreenInitLoad()),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                  const Flexible(
                    flex: 5,
                    child: _RecipeCategories(),
                  ),
                  const Flexible(
                    flex: 3,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      cupertino: (_, __){
        return DecoratedBox(
          decoration: BoxDecoration(
            color: DI.store.state.themeState.currentTheme?.canvasColor,
          ),
          child: BlocProvider<HomeScreenBloc>(
            create: (context) =>
            HomeScreenBloc()..add(const HomeScreenInitLoad()),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                const Flexible(
                  flex: 5,
                  child: _RecipeCategories(),
                ),
                const Flexible(
                  flex: 3,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _RecipeCategories extends StatelessWidget {
  const _RecipeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
        buildWhen: (p, n) => p.formStage != n.formStage,
        builder: (context, state) {
          switch (state.formStage) {
            case FormStage.initial:
            case FormStage.loading:
              return const _LoadingWidget();
            case FormStage.success:
            case FormStage.common:
              return _MainForm(
                state: state,
              );
            case FormStage.failed:
              return const _FailedScreen();
          }
        });
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _MainForm extends StatelessWidget {
  final HomeScreenState state;

  const _MainForm({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RecipesCategory> categories = state.recipesCategories;
    return Column(
      children: [
        PlatformIconButton(
          onPressed: () {},
          icon: Icon(
            PlatformIcons(context).add,
          ),
        ),
        for (var item in categories)
          PlatformText(
            item.title ?? 'f',
          ),
      ],
    );
  }
}

class _FailedScreen extends StatelessWidget {
  const _FailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('failed'),
    );
  }
}

class _ViewModel {
  final FormStage formStage;
  final List<RecipesCategory> recipeCategories;

  static _ViewModel? _instance;

  factory _ViewModel(
      [FormStage? formStage, List<RecipesCategory>? recipeCategories]) {
    return _instance ??
        _ViewModel._internal(
            formStage: formStage!, recipeCategories: recipeCategories!);
  }

  _ViewModel._internal(
      {required this.formStage, required this.recipeCategories});
}
