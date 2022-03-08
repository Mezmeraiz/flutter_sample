import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';

abstract class NotesInteractor {
  saveNote(User user, List<Photo> photos, double latitude, double longitude);

  Future<List<Note>> getNotes();

  Future<Note> getNoteById(int noteId);
}
