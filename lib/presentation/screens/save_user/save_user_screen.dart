import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/map/store/map_store.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';
import 'package:provider/provider.dart';

class SaveUserScreen extends StatefulWidget {
  static const route = "save_user";

  const SaveUserScreen({Key? key}) : super(key: key);

  @override
  _SaveUserScreenState createState() => _SaveUserScreenState();
}

class _SaveUserScreenState extends State<SaveUserScreen> {
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
                const Text("Location"),
                const SizedBox(
                  height: 16,
                ),
                Text(
                    "${_mapStore.markerPosition?.latitude} ${_mapStore.markerPosition?.longitude}"),
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
                    title: "Сохранить",
                    onTap: () =>
                    _userRouterStore.saveNote()),
          ))
        ],
      ),
    );
  }
}
