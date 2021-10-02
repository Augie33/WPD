import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabState = CupertinoTabPage.of(context);
    final brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return CupertinoTabScaffold(
      controller: tabState.controller,
      tabBuilder: tabState.tabBuilder,
      tabBar: CupertinoTabBar(
        activeColor: Theme.of(context).primaryColor,
        iconSize: 32,
        backgroundColor:
            isDarkMode ? Theme.of(context).backgroundColor : Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(CupertinoIcons.square_favorites),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.profile_circled),
          ),
          BottomNavigationBarItem(
            label: 'More',
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }
}
