import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/generated/l10n.dart';
import 'package:flutter_sample/presentation/screens/note_info/location_description_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/location_title_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/name_description_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/name_title_text.dart';
import 'package:flutter_sample/presentation/screens/note_info/photo_list_view.dart';

class NoteInfoScreen extends StatelessWidget {
  final Note note;

  const NoteInfoScreen({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.noteInfo)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
