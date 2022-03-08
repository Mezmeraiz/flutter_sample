import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';

class PhotoInfoScreen extends StatefulWidget {
  static const route = "photo_info";

  final Photo photo;

  const PhotoInfoScreen(this.photo);

  @override
  State<StatefulWidget> createState() => PhotoInfoScreenState();
}

class PhotoInfoScreenState extends State<PhotoInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Image.network(widget.photo.image,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover),
          ],
        ));
  }
}
