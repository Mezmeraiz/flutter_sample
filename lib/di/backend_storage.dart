import 'package:flutter_sample/data/api/error_api.dart';
import 'package:flutter_sample/data/api/photos_api.dart';
import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/di/dependencies_storage.dart';

abstract class BackendStorage {
  UsersApi get usersApi;

  PhotosApi get photosApi;

  ErrorApi get errorApi;
}

class BackendStorageImpl implements BackendStorage {
  final DependenciesStorage _dependenciesStorage;

  BackendStorageImpl({required DependenciesStorage dependenciesStorage})
      : _dependenciesStorage = dependenciesStorage;

  @override
  UsersApi get usersApi => UsersApi(_dependenciesStorage.dio);

  @override
  PhotosApi get photosApi => PhotosApi(_dependenciesStorage.dio);

  @override
  ErrorApi get errorApi => ErrorApi(_dependenciesStorage.dio);
}
