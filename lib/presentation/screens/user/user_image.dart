import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/user.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Image.network(
        user.thumbnail,
        width: 50,
        height: 50,
      ),
    );
  }
}
