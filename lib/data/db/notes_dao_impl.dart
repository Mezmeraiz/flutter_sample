import 'package:flutter_sample/data/db/mapper/db_note_mapper.dart';
import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDAOImpl implements NotesDAO {

  final Database database;

  NotesDAOImpl(this.database);

  @override
  saveNote(Note note) async{
    final source = note.toMap();
    final photos = source.remove("photos");
    database.insert("notes", source);
    final noteId = (await database.rawQuery("select id from notes order by id desc limit 1")).first["id"];
    database.transaction((txn) async {
      for (Map<String, Object?> photo in photos) {
        photo["noteId"] = noteId;
        txn.insert("photos", photo);
      }
    });
  }

}