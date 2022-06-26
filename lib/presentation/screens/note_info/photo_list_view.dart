import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/views/network_image.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: photos.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return AspectRatio(
            aspectRatio: 1,
            child: GestureDetector(
              onTap: () => context.pushRoute(PhotoInfoRoute(photo: photos[index])),
              child: CachedImage(imageUrl: photos[index].thumbnail),
            ),
          );
        },
      ),
    );
  }
}
