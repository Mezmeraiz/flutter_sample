import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/photo.dart';
import 'package:flutter_sample/presentation/screens/photo/bloc/PhotoBloc.dart';
import 'package:flutter_sample/presentation/screens/photo/ckeck_image.dart';
import 'package:flutter_sample/presentation/views/network_image.dart';
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
          CachedImage(imageUrl: photo.thumbnail),
          CheckImage(isSelected: isSelected),
        ],
      ),
    );
  }
}
