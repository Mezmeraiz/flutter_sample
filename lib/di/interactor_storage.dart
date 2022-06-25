import 'package:flutter_sample/di/repository_storage.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/domain/notes_interactor_impl.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/domain/photos_interactor_impl.dart';
import 'package:flutter_sample/domain/users_interactor.dart';
import 'package:flutter_sample/domain/users_interactor_impl.dart';

abstract class InteractorStorage {
  UsersInteractor get usersInteractor;

  PhotosInteractor get photosInteractor;

  NotesInteractor get notesInteractor;
}

class InteractorStorageImpl implements InteractorStorage {
  final RepositoryStorage _repositoryStorage;

  InteractorStorageImpl({required RepositoryStorage repositoryStorage})
      : _repositoryStorage = repositoryStorage;

  UsersInteractor? _usersInteractor;

  PhotosInteractor? _photosInteractor;

  NotesInteractor? _notesInteractor;

  @override
  UsersInteractor get usersInteractor =>
      _usersInteractor ??= UsersInteractorImpl(usersRepository: _repositoryStorage.usersRepository);

  @override
  PhotosInteractor get photosInteractor => _photosInteractor ??=
      PhotosInteractorImpl(photosRepository: _repositoryStorage.photosRepository);

  @override
  NotesInteractor get notesInteractor =>
      _notesInteractor ??= NotesInteractorImpl(notesRepository: _repositoryStorage.notesRepository);
}
