import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

abstract class DependenciesStorage {
  Database get database;

  Dio get dio;
}

class DependenciesStorageImpl implements DependenciesStorage {
  DependenciesStorageImpl({required Database database}) : _database = database;

  final Database _database;

  Dio? _dio;

  @override
  Database get database => _database;

  @override
  Dio get dio => _dio ??= Dio();
}
