import 'package:flutter_sample/data/api/users_api.dart';
import 'package:flutter_sample/data/api/mapper/user_dto_mapper.dart';
import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/data/notes_repository.dart';
import 'package:flutter_sample/data/users_repository.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/user.dart';

class NotesRepositoryImpl implements NotesRepository {

  NotesDAO notesDAO;

  NotesRepositoryImpl({required this.notesDAO});

  @override
  saveNote(Note note){
    notesDAO.saveNote(note);
  }

  // @override
  // Future<List<User>> getUsers(int page, int results, {String? gender}) async =>
  //     (await usersApi.getUsers(page, results, gender: gender)).results.map((e) => e.toUser()).toList();

}