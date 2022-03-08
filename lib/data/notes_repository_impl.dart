import 'package:flutter_sample/data/db/notes_dao.dart';
import 'package:flutter_sample/data/notes_repository.dart';
import 'package:flutter_sample/domain/entities/note.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesDAO notesDAO;

  NotesRepositoryImpl({required this.notesDAO});

  @override
  Future<int> saveNote(Note note) => notesDAO.saveNote(note);

  @override
  Future<List<Note>> getNotes() => notesDAO.getNotes();

  @override
  Future<Note> getNoteById(int noteId) => notesDAO.getNoteById(noteId);
}
