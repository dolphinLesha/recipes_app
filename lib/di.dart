import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:recipes_app/src/data/sqlite/sqlite_config.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';
import 'package:recipes_app/src/model/redux/home_screen/reducer.dart';
import 'package:recipes_app/src/model/redux/state/app_state/app_state.dart';
import 'package:recipes_app/src/model/redux/state/navigation_state/navigation_state.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
import 'package:recipes_app/src/presentation/navigation/redux/router_reducer.dart';
import 'package:recipes_app/src/presentation/redux/theme/theme_reducer.dart';
import 'package:redux/redux.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class DI {
  static Reducer<AppState> get _appReducer => combineReducers([
        NavigationReducer.reducer,
        ThemeReducer.reducer,
      ]);

  static Future<void> init() async {
    GetIt.I.registerSingleton<Store<AppState>>(Store<AppState>(
      DI._appReducer,
      initialState: AppState(
          navigationState: NavigationState(
              navigationHistory: Map.fromIterables(
                  AppNavigationCategory.values,
                  List.generate(AppNavigationCategory.values.length,
                      (index) => const [])))),
    ));

    GetIt.I.registerSingleton<Future<Database>>(openDatabase(
      join(await getDatabasesPath(), SqliteConfig.dbName),
      onCreate: (db, version) {
        print('db create');
        return db.execute(
          SqliteConfig.initialDBQuery,
        );
      },
      onOpen: (db) {
        // initializeDB(db);
      },
      version: 1,
    ));
  }

  static Store<AppState> get store => GetIt.I<Store<AppState>>();

  static Future<Database> get database => GetIt.I<Future<Database>>();
}

void initializeDB(Database db) {
  db.execute('DROP TABLE IF EXISTS ${SqliteConfig.recipeCategoryTableName};');
  db.execute('DROP TABLE IF EXISTS ${SqliteConfig.userInfoTableName};');
  db.execute(
    SqliteConfig.recipeCategoryTableCreate,
  );
  db.execute(
    SqliteConfig.userInfoTableCreate,
  );
  List<RecipesCategory> recipeCategories = [];
  recipeCategories.add(const RecipesCategory(
    title: 'Завтрак',
    color: Colors.cyan,
  ));
  recipeCategories.add(const RecipesCategory(
    title: 'Обед',
    color: Colors.yellow,
  ));
  recipeCategories.add(const RecipesCategory(
    title: 'Ужин',
    color: Colors.orange,
  ));
  recipeCategories.add(const RecipesCategory(
    title: 'Напитки',
    color: Colors.blueGrey,
  ));
  for (var category in recipeCategories) {
    db.insert(SqliteConfig.recipeCategoryTableName, category.toJson());
  }
}
