import 'package:flutter/material.dart';
import 'package:flutter_sample/common/inits.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/navigation/screen_factory.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  static const route = "main";
  final int currentIndex;

  const MainScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPresentationState();
}

class MainPresentationState extends State<MainScreen> {
  late final ScreenFactory _screenFactory;
  late final PageController _pageController;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _screenFactory = sl<ScreenFactory>();
    _pageController = PageController(initialPage: widget.currentIndex);
    _pages = [
      _screenFactory.makeTabScreen(),
      _screenFactory.makeNoteScreen(),
      _screenFactory.makeProfileScreen(),
    ];
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.microtask(() {
      _pageController.jumpToPage(widget.currentIndex);
    });
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
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => context.goNamed(RouteName.main, params: {"tab": index.toString()}),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Users"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Notes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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
