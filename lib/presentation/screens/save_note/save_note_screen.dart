import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common/styles.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';
import 'package:provider/provider.dart';

class SaveNoteScreen extends StatefulWidget {
  static const route = "save_user";

  const SaveNoteScreen({Key? key}) : super(key: key);

  @override
  _SaveNoteScreenState createState() => _SaveNoteScreenState();
}

class _SaveNoteScreenState extends State<SaveNoteScreen> {
  late final PhotoStore _photoStore;
  late final MapStore _mapStore;
  late final UserRouterStore _userRouterStore;

  @override
  void initState() {
    super.initState();
    _photoStore = context.read<PhotoStore>();
    _mapStore = context.read<MapStore>();
    _userRouterStore = context.read<UserRouterStore>();
  }

  @override
  Widget build(BuildContext context) {
    var selectedPhotosList = _photoStore.selectedPhotos.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Save User"),
      ),
      body: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Location",
                  style: blackStylePrimary,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "${_mapStore.markerPosition?.latitude} ${_mapStore.markerPosition?.longitude}",
                  style: blackStyleSecondary,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            onTap: () =>
                _userRouterStore.currentAction = UserRouterAction.backToMap,
          ),
          GestureDetector(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: selectedPhotosList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                          fadeOutDuration: const Duration(milliseconds: 100),
                          fadeInDuration: const Duration(milliseconds: 100),
                          imageUrl: selectedPhotosList[index].thumbnail,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover),
                    );
                  }),
            ),
            onTap: () =>
                _userRouterStore.currentAction = UserRouterAction.backToPhoto,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(16),
            child: ActionButton(
                title: "Сохранить", onTap: () => _userRouterStore.saveNote()),
          ))
        ],
      ),
    );
  }
}
