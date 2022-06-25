import 'package:flutter_sample/data/geo_repository.dart';
import 'package:flutter_sample/data/geo_repository_impl.dart';
import 'package:flutter_sample/data/notes_repository.dart';
import 'package:flutter_sample/data/notes_repository_impl.dart';
import 'package:flutter_sample/data/photos_repository.dart';
import 'package:flutter_sample/data/photos_repository_impl.dart';
import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/data/users_repository_impl.dart';
import 'package:flutter_sample/di/backend_storage.dart';
import 'package:flutter_sample/di/database_storage.dart';

abstract class RepositoryStorage {
  UsersRepository get usersRepository;

  PhotosRepository get photosRepository;

  NotesRepository get notesRepository;

  GeoRepository get geoRepository;
}

class RepositoryStorageImpl implements RepositoryStorage {
  final DatabaseStorage _databaseStorage;
  final BackendStorage _backendStorage;

  RepositoryStorageImpl(
      {required DatabaseStorage databaseStorage, required BackendStorage backendStorage})
      : _databaseStorage = databaseStorage,
        _backendStorage = backendStorage;

  UsersRepository? _usersRepository;

  PhotosRepository? _photosRepository;

  NotesRepository? _notesRepository;

  final GeoRepository _geoRepository = GeoRepositoryImpl();

  @override
  UsersRepository get usersRepository => _usersRepository ??=
      UsersRepositoryImpl(usersApi: _backendStorage.usersApi, errorApi: _backendStorage.errorApi);

  @override
  PhotosRepository get photosRepository =>
      _photosRepository ??= PhotosRepositoryImpl(photosApi: _backendStorage.photosApi);

  @override
  NotesRepository get notesRepository =>
      _notesRepository ??= NotesRepositoryImpl(notesDAO: _databaseStorage.notesDao);

  @override
  GeoRepository get geoRepository => _geoRepository;
}
