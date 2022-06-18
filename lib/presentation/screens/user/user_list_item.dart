import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/user.dart';
import 'package:flutter_sample/navigation/main_router.dart';

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.pushRoute(UserRouterRoute(user: user)),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.network(
                  user.thumbnail,
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                children: [Text("${user.firstName} ${user.lastName}")],
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
