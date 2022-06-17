import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note/note_screen.dart';
import 'package:flutter_sample/presentation/screens/tab/tab_screen.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  final int currentIndex;

  const MainScreen({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainPresentationState();
}

class MainPresentationState extends State<MainScreen> {
  late final PageController _pageController;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentIndex);
    _pages = [
      const TabScreen(),
      const NoteScreen(),
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
