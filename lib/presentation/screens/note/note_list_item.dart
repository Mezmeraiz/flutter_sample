import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note_info/location_description_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/location_title_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/name_description_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/name_title_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/photo_list_view.dart';

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
            const NameTitleText(),
            const SizedBox(height: 16),
            NameDescriptionText(title: "${note.firstName} ${note.lastName}"),
            const SizedBox(height: 16),
            const LocationTitleText(),
            const SizedBox(height: 16),
            LocationDescriptionText(title: "${note.latitude} ${note.longitude}"),
            if (note.photos.isNotEmpty) ...[
              const SizedBox(height: 16),
              PhotoListView(photos: note.photos),
            ]
          ],
        ),
      ),
    );
  }
}
