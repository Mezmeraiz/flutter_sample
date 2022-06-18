import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/navigation/main_router.dart';

class NoteListItem extends StatelessWidget {
  final Note note;

  const NoteListItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(NoteInfoRoute(note: note)),
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16),
            Text(
              "${note.firstName} ${note.lastName}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 16),
            Text(
              "Location",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16),
            Text(
              "${note.latitude} ${note.longitude}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            if (note.photos.isNotEmpty) ...[
              const SizedBox(height: 16),
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
                          fit: BoxFit.cover,
                        ),
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
