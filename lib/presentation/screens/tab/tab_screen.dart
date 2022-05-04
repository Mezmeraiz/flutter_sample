import 'package:flutter/material.dart';
import 'package:flutter_sample/common/colors.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';

class TabScreen extends StatefulWidget {
  static const route = "main";

  const TabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPresentationState();
}

class MainPresentationState extends State<TabScreen>
    with AutomaticKeepAliveClientMixin<TabScreen> {
  late final ScreenFactory _screenFactory;

  @override
  void initState() {
    super.initState();
    _screenFactory = sl<ScreenFactory>();
  }

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
                bottom: TabBar(indicatorColor: Colors.white, tabs: [
                  Tab(text: "All"),
                  Tab(text: "Male"),
                  Tab(text: "Female"),
                ]),
              ),
            ],
            body: TabBarView(children: [
              _screenFactory.makeUserScreen(null),
              _screenFactory.makeUserScreen("male"),
              _screenFactory.makeUserScreen("female"),
            ]),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
