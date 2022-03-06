import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/user.dart';

abstract class NotesRepository {

  saveNote(Note note);

  Future<List<Note>> getNotes();

}