import 'package:flutter_sample/domain/entities/note.dart';

abstract class NotesDAO {
  Future<int> saveNote(Note note);

  Future<List<Note>> getNotes();

  Future<Note> getNoteById(int noteId);
}
