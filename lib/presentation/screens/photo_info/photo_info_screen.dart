import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';

class PhotoInfoScreen extends StatelessWidget {
  final Photo photo;

  const PhotoInfoScreen(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
