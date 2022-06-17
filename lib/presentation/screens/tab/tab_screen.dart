import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/user/user_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TabState();
}

class TabState extends State<TabScreen> with AutomaticKeepAliveClientMixin<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            const SliverAppBar(
              floating: true,
              pinned: true,
              title: Text("TabScreen"),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Male"),
                  Tab(text: "Female"),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              UserScreen(),
              UserScreen(gender: "male"),
              UserScreen(gender: "female"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
