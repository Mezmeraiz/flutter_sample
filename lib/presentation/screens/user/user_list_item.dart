import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/presentation/screens/user/user_image.dart';

class UserListItem extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserListItem({Key? key, required this.user, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              UserImage(user: user),
              Text("${user.firstName} ${user.lastName}"),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
