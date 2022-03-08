import 'package:flutter_sample/data/notes_repository.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';

class NotesInteractorImpl implements NotesInteractor {
  NotesRepository notesRepository;

  NotesInteractorImpl({required this.notesRepository});

  @override
  Future<int> saveNote(
      User user, List<Photo> photos, double latitude, double longitude) {
    var note = Note(
        id: null,
        firstName: user.firstName,
        lastName: user.lastName,
        picture: user.picture,
        thumbnail: user.thumbnail,
        gender: user.gender,
        latitude: latitude,
        longitude: longitude,
        photos: photos);
    return notesRepository.saveNote(note);
  }

  @override
  Future<List<Note>> getNotes() => notesRepository.getNotes();

  @override
  Future<Note> getNoteById(int noteId) => notesRepository.getNoteById(noteId);
}
