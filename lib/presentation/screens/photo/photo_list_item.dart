import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/photo/bloc/PhotoBloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PhotoListItem extends StatelessWidget {
  final Photo photo;
  final bool isSelected;

  const PhotoListItem({Key? key, required this.photo, required this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<PhotoBloc>().add(SelectPhotoEvent(selectedPhoto: photo)),
      child: Stack(
        children: [
          CachedNetworkImage(
            fadeOutDuration: const Duration(milliseconds: 100),
            fadeInDuration: const Duration(milliseconds: 100),
            imageUrl: photo.thumbnail,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(8),
            child: isSelected
                ? SvgPicture.asset(
                    "assets/icons/check_circle.svg",
                    color: Colors.blue,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
