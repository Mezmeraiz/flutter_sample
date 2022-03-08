import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:flutter_sample/presentation/screens/user/user_list_item.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen>
    with AutomaticKeepAliveClientMixin<UserScreen> {
  late final UserStore _userStore;

  @override
  void initState() {
    super.initState();
    _userStore = context.read<UserStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          return ListView.builder(
              itemCount: _userStore.users.length,
              itemBuilder: (_, index) {
                return UserListItem(position: index);
              });
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
