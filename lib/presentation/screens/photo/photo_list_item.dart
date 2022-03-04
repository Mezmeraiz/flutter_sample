import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/presentation/screens/photo/store/photo_store.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PhotoListItem extends StatelessWidget {
  final int position;

  const PhotoListItem({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var photoStore = context.read<PhotoStore>();
    var photo = photoStore.photos[position];
    //var isSelected = photoStore.selectedPhotos.contains(photo);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        photoStore.onTapPhoto(position);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
              fadeOutDuration: const Duration(milliseconds: 100),
              fadeInDuration: const Duration(milliseconds: 100),
              imageUrl: photo.thumbnail,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(8),
            child: Observer(
              builder: (_) {
                return photoStore.selectedPhotos.contains(photo)
                    ? SvgPicture.asset(
                        "assets/icons/check_circle.svg",
                        color: Colors.blue,
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
