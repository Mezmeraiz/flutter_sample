import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_sample/presentation/screens/user/store/user_store.dart';
import 'package:flutter_sample/presentation/screens/user/user_list_item.dart';
import 'package:flutter_sample/presentation/views/content_view.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  UserScreenState createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> with AutomaticKeepAliveClientMixin<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentView<UserStore>(builder: (_) => const ContentWidget()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userStore = context.read<UserStore>();
    return Observer(
      builder: (_) {
        return ListView.builder(
            itemCount: _userStore.users.length,
            itemBuilder: (_, index) {
              return UserListItem(position: index);
            });
      },
    );
  }
}
