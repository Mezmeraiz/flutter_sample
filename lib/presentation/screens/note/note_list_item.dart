import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common/colors.dart';
import 'package:flutter_sample/common/styles.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/map/map_screen.dart';
import 'package:flutter_sample/presentation/screens/note/store/note_store.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:provider/provider.dart';

class NoteListItem extends StatelessWidget {
  final int position;

  const NoteListItem({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteStore = context.read<NoteStore>();
    var note = noteStore.notes[position];
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: BoxDecoration(
          color: colorCard, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        //onTap: () => Navigator.pushNamed(context, UserRouter.route, arguments: user),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: blackStylePrimary,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "${note.firstName} ${note.lastName}",
              style: blackStyleSecondary,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Location", style: blackStylePrimary),
            const SizedBox(
              height: 16,
            ),
            Text(
              "${note.latitude} ${note.longitude}",
              style: blackStyleSecondary,
            ),
            if (note.photos.isNotEmpty) ...[
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: note.photos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: CachedNetworkImage(
                            fadeOutDuration: const Duration(milliseconds: 100),
                            fadeInDuration: const Duration(milliseconds: 100),
                            imageUrl: note.photos[index].thumbnail,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover),
                      );
                    }),
              )
            ]
          ],
        ),
      ),
    );
  }
}
