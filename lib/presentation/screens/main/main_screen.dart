import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/presentation/screens/photo/photo_screen.dart';

class MainScreen extends StatefulWidget {
  static const route = "main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPresentationState();
}

class MainPresentationState extends State<MainScreen> {
  late final ScreenFactory _screenFactory;
  late final PageController _pageController;
  late final List<Widget> _pages;
  var _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _screenFactory =  sl<ScreenFactory>();
    _pageController = PageController();
    _pages = [
      _screenFactory.makeTabScreen(),
      _screenFactory.makeSavedScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(_currentIndex);
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Saved"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

}
