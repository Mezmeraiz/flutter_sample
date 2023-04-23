import 'package:flutter_sample/data/database/database_helper.dart';
import 'package:flutter_sample/data/storage/storage.dart';
import 'package:flutter_sample/di/common/initialization_result.dart';
import 'package:flutter_sample/di/factory/backend_factory.dart';
import 'package:flutter_sample/di/factory/bloc_factory.dart';
import 'package:flutter_sample/di/factory/database_factory.dart';
import 'package:flutter_sample/di/factory/dependency_factory.dart';
import 'package:flutter_sample/di/factory/repository_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

abstract class InitializationHelper {
  Future<InitializationResult> init();
}

class InitializationHelperIo extends InitializationHelper {
  @override
  Future<InitializationResult> init() async {
    final Database database = await DatabaseHelper().open();
    final Storage storage = StorageImpl(sharedPreferences: await SharedPreferences.getInstance());

    final dependenciesFactory = DependencyFactoryImpl(
      database: database,
      storage: storage,
    );

    final databaseFactory = DatabaseFactoryImpl(
      dependenciesFactory: dependenciesFactory,
    );

    final backendFactory = BackendFactoryImpl(
      dependenciesFactory: dependenciesFactory,
    );

    final repositoryFactory = RepositoryFactoryImpl(
      dependencyFactory: dependenciesFactory,
      backendFactory: backendFactory,
      databaseFactory: databaseFactory,
    );

    final blocFactory = BlocFactoryImpl(repositoryFactory: repositoryFactory);

    return InitializationResult(
      dependenciesFactory: dependenciesFactory,
      blocFactory: blocFactory,
    );
  }
}

class InitializationHelperWeb extends InitializationHelper {
  @override
  Future<InitializationResult> init() async {
    final Storage storage = StorageImpl(sharedPreferences: await SharedPreferences.getInstance());

    final dependenciesFactory = DependencyFactoryImpl(
      storage: storage,
    );

    final databaseFactory = DatabaseWebFactoryImpl(
      dependenciesFactory: dependenciesFactory,
    );

    final backendFactory = BackendFactoryImpl(
      dependenciesFactory: dependenciesFactory,
    );

    final repositoryFactory = RepositoryFactoryImpl(
      dependencyFactory: dependenciesFactory,
      backendFactory: backendFactory,
      databaseFactory: databaseFactory,
    );

    final blocFactory = BlocFactoryImpl(repositoryFactory: repositoryFactory);

    return InitializationResult(
      dependenciesFactory: dependenciesFactory,
      blocFactory: blocFactory,
    );
  }
}
