import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/data/db/notes_dao_impl.dart';
import 'package:flutter_sample/di/dependencies_storage.dart';

abstract class DatabaseStorage {
  NotesDAO get notesDao;
}

class DatabaseStorageImpl implements DatabaseStorage {
  final DependenciesStorage _dependenciesStorage;

  DatabaseStorageImpl({required DependenciesStorage dependenciesStorage})
      : _dependenciesStorage = dependenciesStorage;

  NotesDAO? _notesDAO;

  @override
  NotesDAO get notesDao => _notesDAO ??= NotesDAOImpl(_dependenciesStorage.database);
}
