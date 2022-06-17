import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

part 'save_note_bloc.freezed.dart';

@freezed
class SaveNoteEvent with _$SaveNoteEvent {
  const SaveNoteEvent._();

  const factory SaveNoteEvent.done() = DoneSaveNoteEvent;
}

@freezed
class SaveNoteState with _$SaveNoteState {
  const SaveNoteState._();

  Note? get note => whenOrNull(done: (note) => note);

  List<Photo>? get selectedPhotos => whenOrNull(dataChanged: (_, selectedPhotos) => selectedPhotos);

  LatLng? get markerPosition =>
      whenOrNull<LatLng?>(dataChanged: (markerPosition, _) => markerPosition);

  const factory SaveNoteState.dataChanged(
      {LatLng? markerPosition, required List<Photo> selectedPhotos}) = DataChangedSaveNoteState;

  const factory SaveNoteState.done({required Note note}) = DoneSaveNoteState;
}

class SaveNoteBloc extends Bloc<SaveNoteEvent, SaveNoteState> {
  SaveNoteBloc({required this.userRouterRepository, required this.notesInteractor})
      : super(SaveNoteState.dataChanged(
            markerPosition: userRouterRepository.markerPositionStreamController.value,
            selectedPhotos: userRouterRepository.selectedPhotosStreamController.value.toList())) {
    on<DoneSaveNoteEvent>(_done);
    _subscribeUserRouterRepository();
  }

  final UserRouterRepository userRouterRepository;

  final NotesInteractor notesInteractor;

  late final StreamSubscription _streamSubscription;

  Future<void> _done(
    DoneSaveNoteEvent event,
    Emitter<SaveNoteState> emit,
  ) async {
    final currentState = state;
    if (currentState is DataChangedSaveNoteState) {
      final noteId = await notesInteractor.saveNote(
          userRouterRepository.user,
          currentState.selectedPhotos.toList(),
          currentState.markerPosition!.latitude,
          currentState.markerPosition!.longitude);
      final note = await notesInteractor.getNoteById(noteId);
      emit(SaveNoteState.done(note: note));
    }
  }

  _subscribeUserRouterRepository() {
    _streamSubscription = Rx.combineLatest2<LatLng?, Set<Photo>, SaveNoteState>(
      userRouterRepository.markerPositionStreamController.stream,
      userRouterRepository.selectedPhotosStreamController.stream,
      (markerPosition, selectedPhotos) => SaveNoteState.dataChanged(
          markerPosition: markerPosition, selectedPhotos: selectedPhotos.toList()),
    ).listen((state) => emit(state));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
