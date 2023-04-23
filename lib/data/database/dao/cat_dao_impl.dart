import 'package:flutter_sample/data/database/database_helper.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:sqflite/sqflite.dart';

abstract class CatDao {
  Future<void> saveCat({required Cat cat});

  Future<List<Cat>> getCats();

  Future<Cat> getCat({required String id});
}

class CatNotFoundException {}

class CatDaoImpl implements CatDao {
  final Database database;

  CatDaoImpl({required this.database});

  @override
  Future<void> saveCat({required Cat cat}) async {
    await database.insert(
      catTableName,
      cat.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Cat>> getCats() async => (await database.query(catTableName)).map((e) => Cat.fromJson(e)).toList();

  @override
  Future<Cat> getCat({required String id}) async {
    final result = await database.query(
      catTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Cat.fromJson(result.first) : throw CatNotFoundException();
  }
}
