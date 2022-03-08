import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/user_router/user_router.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:provider/provider.dart';

class UserListItem extends StatelessWidget {
  final int position;

  const UserListItem({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userStore = context.read<UserStore>();
    var user = userStore.users[position];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          Navigator.pushNamed(context, UserRouter.route, arguments: user),
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
