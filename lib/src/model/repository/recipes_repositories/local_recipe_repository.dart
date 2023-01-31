import 'package:recipes_app/di.dart';
import 'package:recipes_app/src/data/sqlite/sqlite_config.dart';
import 'package:recipes_app/src/model/models/recipes_category/recipes_category.dart';
import 'package:recipes_app/src/model/repository/recipes_repositories/recipes_repository.dart';
import 'package:sqflite/sqflite.dart';

class LocalRecipesRepository implements RecipesRepository{


  @override
  Future<List<RecipesCategory>> getRecipeCategories() async {
      final db = await DI.database;
      final List<Map<String, dynamic>> maps = await db.query(SqliteConfig.recipeCategoryTableName);

      return List.generate(maps.length, (index) {
        // maps[index]['gradient'] = {
        //   'color1': maps[index]['color1'],
        //   'color2': maps[index]['color2'],
        // };
        return RecipesCategory.fromJson(maps[index]);});
  }

  @override
  Future<bool> addRecipeCategory({required RecipesCategory category}) async {
    final db = await DI.database;

    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO ${SqliteConfig.recipeCategoryTableName}(title, color, color1, color2) VALUES("some name", 1234, 456.789)');
    });

    return true;
  }

}