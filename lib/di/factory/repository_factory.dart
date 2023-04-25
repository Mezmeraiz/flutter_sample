import 'package:flutter_sample/data/auth_repository.dart';
import 'package:flutter_sample/data/cat_repository.dart';
import 'package:flutter_sample/data/refresh_saved_repository.dart';
import 'package:flutter_sample/di/factory/backend_factory.dart';
import 'package:flutter_sample/di/factory/database_factory.dart';
import 'package:flutter_sample/di/factory/dependency_factory.dart';

abstract class RepositoryFactory {
  AuthRepository get authRepository;

  CatRepository get catRepository;

  RefreshSavedRepository get refreshSavedRepository;
}

class RepositoryFactoryImpl implements RepositoryFactory {
  final DependencyFactory _dependencyFactory;

  final DatabaseFactory _databaseFactory;

  final BackendFactory _backendFactory;

  RepositoryFactoryImpl({
    required DependencyFactory dependencyFactory,
    required DatabaseFactory databaseFactory,
    required BackendFactory backendFactory,
  })  : _dependencyFactory = dependencyFactory,
        _databaseFactory = databaseFactory,
        _backendFactory = backendFactory;

  AuthRepository? _authRepository;

  CatRepository? _catRepository;

  final RefreshSavedRepository _refreshSavedRepository = RefreshSavedRepositoryImpl();

  @override
  AuthRepository get authRepository => _authRepository ??= AuthRepositoryImpl(
        storage: _dependencyFactory.storage,
      );

  @override
  CatRepository get catRepository => _catRepository ??= CatRepositoryImpl(
        catApi: _backendFactory.catApi,
        catDao: _databaseFactory.catDao,
      );

  @override
  RefreshSavedRepository get refreshSavedRepository => _refreshSavedRepository;
}
