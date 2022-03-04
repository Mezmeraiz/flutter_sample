

import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDAOImpl implements NotesDAO {

  final Database database;

  NotesDAOImpl(this.database);

  @override
  Future<void> addNote(Note note) {
    // TODO: implement addNote
    throw UnimplementedError();
  }

}