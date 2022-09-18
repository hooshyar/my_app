import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:my_app/src/screens/home/favorite.dart';
import 'package:my_app/src/screens/home/home_screen.dart';
import 'package:my_app/src/screens/home/profile.dart';

class BottomNavigationBarForScreens extends StatefulWidget {
  const BottomNavigationBarForScreens({super.key});

  @override
  State<BottomNavigationBarForScreens> createState() =>
      _BottomNavigationBarForScreensState();
}

class _BottomNavigationBarForScreensState
    extends State<BottomNavigationBarForScreens> {
  int currentPageIndex = 0;
  var screens = [HomeScreen(), Favotite(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          showUnselectedLabels: false,
          currentIndex: currentPageIndex,
          onTap: (index) => setState(() {
            currentPageIndex = index;
            screens = screens;
          }),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            ),
          ],
        ));
  }
}
