import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/generated/l10n.dart';

class PhotoInfoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoInfoScreen(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.current.photoInfo)),
      body: Stack(
        children: [
          Image.network(
            photo.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
