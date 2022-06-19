import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/navigation/main_router.dart';
import 'package:flutter_sample/presentation/screens/note/note_screen.dart';
import 'package:flutter_sample/presentation/screens/tab/tab_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        TabRouter(),
        NoteRouter(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.group), label: "Users"),
              BottomNavigationBarItem(icon: Icon(Icons.save), label: "Notes"),
            ],
          ),
        );
      },
    );
  }
}