import 'package:flutter/material.dart';
import 'package:recipes_app/src/app.dart';
import 'package:recipes_app/src/data/sqlite/sqlite_config.dart';
import 'package:recipes_app/src/model/bloc/user/actions.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.init();
  // await (await DI.database).rawDelete('DROP TABLE IF EXISTS ${SqliteConfig.recipeCategoryTableName};');
  final tables = await (await DI.database)
      .rawQuery('SELECT * FROM sqlite_master ORDER BY name;');

  loadUser();

  runApp(const App());
}

void loadUser() {
  DI.userBloc.add(const UserInitLoad());
}
