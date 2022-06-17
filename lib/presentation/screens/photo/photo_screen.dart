import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/data/user_router_repository.dart';
import 'package:flutter_sample/domain/photos_interactor.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_bloc.dart';
import 'package:flutter_sample/presentation/screens/photo/bloc/PhotoBloc.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_list_item.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';
import 'package:go_router/go_router.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PhotoScreenState();
}

class PhotoScreenState extends State<PhotoScreen> {
  late final ScrollController _scrollController;

  late final PhotoBloc _photoBloc;

  @override
  void initState() {
    super.initState();
    _photoBloc = PhotoBloc(
      photosInteractor: context.read<PhotosInteractor>(),
      userRouterRepository: context.read<UserRouterRepository>(),
    )..add(const FetchPhotoEvent());
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _photoBloc.add(const FetchPhotoEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _photoBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Photos"),
          leading: BackButton(onPressed: context.pop),
        ),
        body: BlocBuilder<PhotoBloc, PhotoState>(
          buildWhen: (p, c) => c is FetchedPhotoState || c is InitialPhotoState,
          builder: (context, state) {
            if (state is FetchedPhotoState) {
              return Stack(
                children: [
                  GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: state.photos.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return BlocBuilder<PhotoBloc, PhotoState>(
                        buildWhen: (p, c) =>
                            c is SelectedPhotoState && c.selectedPhoto == state.photos[index],
                        builder: (context, state) => PhotoListItem(
                          photo: state.photos[index],
                          isSelected: state.selectedPhotos.contains(state.photos[index]),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<PhotoBloc, PhotoState>(
                    buildWhen: (p, c) => c is SelectedPhotoState,
                    builder: (context, state) => AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      left: 16,
                      right: 16,
                      bottom: state.selectedPhotos.isNotEmpty ? 16 : -100,
                      child: ActionButton(
                        title: "Далее",
                        onTap: () => context.read<UserRouterBloc>().add(
                              const UserRouterEvent.action(action: UserRouterAction.next),
                            ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
