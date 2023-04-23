import 'package:flutter_sample/data/database/dao/cat_dao_impl.dart';
import 'package:flutter_sample/data/database/dao/cat_dao_web_impl.dart';
import 'package:flutter_sample/di/factory/dependency_factory.dart';

abstract class DatabaseFactory {
  CatDao get catDao;
}

class DatabaseFactoryImpl implements DatabaseFactory {
  final DependencyFactory _dependenciesFactory;

  DatabaseFactoryImpl({required DependencyFactory dependenciesFactory}) : _dependenciesFactory = dependenciesFactory;

  CatDao? _catDao;

  @override
  CatDao get catDao => _catDao ??= CatDaoImpl(database: _dependenciesFactory.database!);
}

class DatabaseWebFactoryImpl implements DatabaseFactory {
  final DependencyFactory _dependenciesFactory;

  DatabaseWebFactoryImpl({required DependencyFactory dependenciesFactory}) : _dependenciesFactory = dependenciesFactory;

  CatDao? _catDao;

  @override
  CatDao get catDao => _catDao ??= CatDaoWebImpl(storage: _dependenciesFactory.storage);
}
