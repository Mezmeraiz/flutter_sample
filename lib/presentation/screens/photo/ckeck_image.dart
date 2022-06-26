import 'package:flutter/material.dart';
import 'package:flutter_sample/common/assets_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckImage extends StatelessWidget {
  const CheckImage({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.all(8),
      child: isSelected
          ? SvgPicture.asset(
              AssetIcons.checkCircle,
              color: Colors.blue,
            )
          : const SizedBox.shrink(),
    );
  }
}
