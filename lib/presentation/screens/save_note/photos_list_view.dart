import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/views/network_image.dart';

class PhotosListView extends StatelessWidget {
  const PhotosListView({Key? key, required this.selectedPhotos}) : super(key: key);

  final List<Photo>? selectedPhotos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: selectedPhotos!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) {
        return AspectRatio(
          aspectRatio: 1,
          child: CachedImage(imageUrl: selectedPhotos![index].thumbnail),
        );
      },
    );
  }
}
