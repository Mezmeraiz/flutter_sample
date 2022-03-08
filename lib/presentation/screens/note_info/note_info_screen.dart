import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/common/styles.dart';
import 'package:flutter_sample/domain/entities/note.dart';
import 'package:flutter_sample/presentation/screens/photo_info/photo_info_screen.dart';

class NoteInfoScreen extends StatefulWidget {
  static const route = "note_info";
  final Note note;

  const NoteInfoScreen({Key? key, required this.note}) : super(key: key);

  @override
  _NoteInfoScreenState createState() => _NoteInfoScreenState();
}

class _NoteInfoScreenState extends State<NoteInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Info"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              "${widget.note.firstName} ${widget.note.lastName}",
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
              "${widget.note.latitude} ${widget.note.longitude}",
              style: blackStyleSecondary,
            ),
            if (widget.note.photos.isNotEmpty) ...[
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: widget.note.photos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, PhotoInfoScreen.route,
                              arguments: widget.note.photos[index]),
                          child: CachedNetworkImage(
                              fadeOutDuration:
                                  const Duration(milliseconds: 100),
                              fadeInDuration: const Duration(milliseconds: 100),
                              imageUrl: widget.note.photos[index].thumbnail,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover),
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
