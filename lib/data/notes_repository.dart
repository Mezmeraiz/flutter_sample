import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/user.dart';

abstract class NotesRepository {

  //Future<List<User>> getUsers(int page, int results, {String? gender});
  saveNote(Note note);

}