import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/navigation/custom_user_router/user_router_store.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_list_item.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_sample/presentation/views/action_button.dart';
import 'package:go_router/go_router.dart';

class PhotoScreen extends StatefulWidget {
  static const route = "photo";

  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PhotoScreenState();
}

class PhotoScreenState extends State<PhotoScreen> {
  late final ScrollController _scrollController;

  late final UserRouterStore _userRouterStore;

  late final PhotoStore _photoStore;

  @override
  void initState() {
    super.initState();
    _photoStore = context.read<PhotoStore>();
    _userRouterStore = context.read<UserRouterStore>();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        context.read<PhotoStore>().getPhotos();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos"),
        leading: BackButton(onPressed: context.pop),
      ),
      body: Stack(
        children: [
          Observer(
            builder: (context) {
              return Stack(
                children: [
                  GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(16),
                      itemCount: _photoStore.photos.length,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200, crossAxisSpacing: 20, mainAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        return PhotoListItem(position: index);
                      }),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    left: 16,
                    right: 16,
                    bottom: _photoStore.selectedPhotos.isNotEmpty ? 16 : -100,
                    child: ActionButton(
                        title: "Далее",
                        onTap: () => _userRouterStore.currentAction = UserRouterAction.next),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
