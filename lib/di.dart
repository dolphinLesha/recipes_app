import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:recipes_app/src/data/sqlite/sqlite_config.dart';
import 'package:recipes_app/src/model/bloc/navigation/bloc.dart';
import 'package:recipes_app/src/model/bloc/theme/bloc.dart';
import 'package:recipes_app/src/model/bloc/user/bloc.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';
import 'package:recipes_app/src/model/bloc/navigation/state/navigation_state.dart';
import 'package:recipes_app/src/presentation/navigation/app_navigation_categories/app_nav_categories.dart';
// import 'package:redux/redux.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

class DI {

  static Future<void> init() async {

    GetIt.I.registerSingleton<NavigationBloc>(NavigationBloc());
    GetIt.I.registerSingleton<ThemeBloc>(ThemeBloc());
    GetIt.I.registerSingleton<UserBloc>(UserBloc());

    GetIt.I.registerSingleton<Future<Database>>(openDatabase(
      join(await getDatabasesPath(), SqliteConfig.dbName),
      onCreate: (db, version) {
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

  static Future<Database> get database => GetIt.I<Future<Database>>();
  static NavigationBloc get navigationBloc => GetIt.I<NavigationBloc>();
  static ThemeBloc get themeBloc => GetIt.I<ThemeBloc>();
  static UserBloc get userBloc => GetIt.I<UserBloc>();
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
