import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/di/interactor_storage.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_bloc.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note/bloc/note_bloc.dart';
import 'package:flutter_sample/presentation/screens/save_note/bloc/save_note_bloc.dart';
import 'package:flutter_sample/presentation/screens/save_note/location_description_text.dart';
import 'package:flutter_sample/presentation/screens/save_note/location_title_text.dart';
import 'package:flutter_sample/presentation/screens/save_note/photos_list_view.dart';
import 'package:flutter_sample/presentation/screens/save_note/save_notes_button.dart';

class SaveNoteScreen extends StatelessWidget {
  const SaveNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveNoteBloc(
        userRouterRepository: context.read<UserRouterRepository>(),
        notesInteractor: context.read<InteractorStorage>().notesInteractor,
      ),
      child: const SaveNoteScreenView(),
    );
  }
}

class SaveNoteScreenView extends StatelessWidget {
  const SaveNoteScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.saveUser)),
      body: BlocListener<SaveNoteBloc, SaveNoteState>(
        listenWhen: (p, c) => c is DoneSaveNoteState,
        listener: (context, state) => _onDone(context, state.note),
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const LocationTitleText(),
                  const SizedBox(height: 16),
                  BlocBuilder<SaveNoteBloc, SaveNoteState>(
                    buildWhen: (p, c) =>
                        c is DataChangedSaveNoteState && p.markerPosition != c.markerPosition,
                    builder: (context, state) => LocationDescriptionText(
                      latitude: state.markerPosition?.latitude,
                      longitude: state.markerPosition?.longitude,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              onTap: () => _onTapMap(context),
            ),
            GestureDetector(
              child: SizedBox(
                height: 100,
                child: BlocBuilder<SaveNoteBloc, SaveNoteState>(
                  buildWhen: (p, c) =>
                      c is DataChangedSaveNoteState &&
                      p.selectedPhotos?.length != c.selectedPhotos.length,
                  builder: (context, state) => PhotosListView(selectedPhotos: state.selectedPhotos),
                ),
              ),
              onTap: () => _onTapPhoto(context),
            ),
            SaveNotesButton(onTap: () => _onTapSave(context))
          ],
        ),
      ),
    );
  }

  void _onDone(BuildContext context, Note? note) {
    context.read<NoteBloc>().add(const FetchNoteEvent());
    context.router.root.navigate(const TabRouter(children: [
      TabRoute(),
    ]));
    context.router.root.navigate(NoteRouter(children: [
      const NoteRoute(),
      NoteInfoRoute(note: note!),
    ]));
  }

  void _onTapMap(BuildContext context) => context
      .read<UserRouterBloc>()
      .add(const UserRouterEvent.action(action: UserRouterAction.backToMap));

  void _onTapPhoto(BuildContext context) => context
      .read<UserRouterBloc>()
      .add(const UserRouterEvent.action(action: UserRouterAction.backToPhoto));

  void _onTapSave(BuildContext context) =>
      context.read<SaveNoteBloc>().add(const DoneSaveNoteEvent());
}
