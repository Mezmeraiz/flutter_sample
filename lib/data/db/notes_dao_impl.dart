import 'package:flutter_sample/data/db/mapper/note_db_mapper.dart';
import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:sqflite/sqflite.dart';

class NotesDAOImpl implements NotesDAO {
  final Database database;

  NotesDAOImpl(this.database);

  @override
  Future<int> saveNote(Note note) async {
    final source = note.toMap();
    final photos = source.remove("photos");
    database.insert("notes", source);
    final int noteId = (await database
            .rawQuery("select id from notes order by id desc limit 1"))
        .first["id"] as int;
    await database.transaction((txn) async {
      for (Map<String, Object?> photo in photos) {
        photo["noteId"] = noteId;
        await txn.insert("photos", photo);
      }
    });
    return noteId;
  }

  @override
  Future<List<Note>> getNotes() async {
    final result = await database.query("notes");
    final List<Map<String, Object?>> notes = [];
    for (Map<String, Object?> item in result) {
      final Map<String, Object?> note = {}..addAll(item);
      final photos = await database
          .query("photos", where: "noteId = ?", whereArgs: [note["id"]]);
      note["photos"] = photos;
      notes.add(note);
    }
    return notes.map((e) => NoteDBMapper.fromMap(e)).toList();
  }

  @override
  Future<Note> getNoteById(int noteId) async {
    final result =
        await database.query("notes", where: "id = ?", whereArgs: [noteId]);
    final Map<String, Object?> note = {}..addAll(result[0]);
    final photos = await database
        .query("photos", where: "noteId = ?", whereArgs: [note["id"]]);
    note["photos"] = photos;
    return NoteDBMapper.fromMap(note);
  }
}
