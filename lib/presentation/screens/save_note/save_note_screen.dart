import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/domain/notes_interactor.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_bloc.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note/bloc/note_bloc.dart';
import 'package:flutter_sample/presentation/screens/save_note/bloc/save_note_bloc.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';

class SaveNoteScreen extends StatelessWidget {
  const SaveNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SaveNoteBloc(
        userRouterRepository: context.read<UserRouterRepository>(),
        notesInteractor: context.read<NotesInteractor>(),
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
      appBar: AppBar(title: const Text("Save User")),
      body: BlocListener<SaveNoteBloc, SaveNoteState>(
        listenWhen: (p, c) => c is DoneSaveNoteState,
        listener: (context, state) {
          context.read<NoteBloc>().add(const FetchNoteEvent());
          context.router.root.navigate(const TabRouter(children: [
            TabRoute(),
          ]));
          context.router.root.navigate(NoteRouter(children: [
            const NoteRoute(),
            NoteInfoRoute(note: state.note!),
          ]));
        },
        child: Column(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Location",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<SaveNoteBloc, SaveNoteState>(
                    buildWhen: (p, c) =>
                        c is DataChangedSaveNoteState && p.markerPosition != c.markerPosition,
                    builder: (context, state) => Text(
                      "${state.markerPosition?.latitude} ${state.markerPosition?.longitude}",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              onTap: () => context
                  .read<UserRouterBloc>()
                  .add(const UserRouterEvent.action(action: UserRouterAction.backToMap)),
            ),
            GestureDetector(
              child: SizedBox(
                height: 100,
                child: BlocBuilder<SaveNoteBloc, SaveNoteState>(
                  buildWhen: (p, c) =>
                      c is DataChangedSaveNoteState &&
                      p.selectedPhotos?.length != c.selectedPhotos.length,
                  builder: (context, state) => ListView.builder(
                    itemCount: state.selectedPhotos!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: CachedNetworkImage(
                          fadeOutDuration: const Duration(milliseconds: 100),
                          fadeInDuration: const Duration(milliseconds: 100),
                          imageUrl: state.selectedPhotos![index].thumbnail,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ),
              onTap: () => context
                  .read<UserRouterBloc>()
                  .add(const UserRouterEvent.action(action: UserRouterAction.backToPhoto)),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(16),
                child: ActionButton(
                  title: "Сохранить",
                  onTap: () => context.read<SaveNoteBloc>().add(const DoneSaveNoteEvent()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
