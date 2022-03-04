import 'package:flutter_sample/domain/entities/note.dart';

abstract class NotesDAO {

  Future<void> addNote(Note note);

}