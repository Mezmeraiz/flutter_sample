import 'package:flutter_sample/data/api/cat/cat_api.dart';
import 'package:flutter_sample/di/factory/dependency_factory.dart';

abstract class BackendFactory {
  CatApi get catApi;
}

class BackendFactoryImpl implements BackendFactory {
  final DependencyFactory _dependenciesFactory;

  BackendFactoryImpl({required DependencyFactory dependenciesFactory}) : _dependenciesFactory = dependenciesFactory;

  @override
  CatApi get catApi => CatApi(_dependenciesFactory.dio);
}
