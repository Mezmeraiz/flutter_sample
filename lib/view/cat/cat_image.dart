import 'package:flutter/material.dart';
import 'package:flutter_sample/data/model/cat.dart';
import 'package:flutter_sample/view/common/base_network_image.dart';

class CatImage extends StatelessWidget {
  final Cat cat;

  const CatImage({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 48,
          height: 48,
          child: BaseNetworkImage(
            imageUrl: cat.picture,
          ),
        ),
      );
}
