import 'package:flutter/material.dart';
import 'package:tom2/screens/home.dart';
import 'package:tom2/screens/profile.dart';
import 'package:tom2/screens/services.dart';

class NavMenu extends StatefulWidget {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  NavMenu({super.key});

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            widget.pageIndex = value;
            widget._pageController.jumpToPage(value);
          });
        },
        controller: widget._pageController,
        children: [
          Home(),
          profile(),
          Services(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(140, 92, 37, 141),
        selectedIndex: widget.pageIndex,
        onDestinationSelected: (index) {
          setState(() {
            widget.pageIndex = index;
            widget._pageController.jumpToPage(index);
          });
        },
        height: 60,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.map_outlined),
              selectedIcon: Icon(Icons.map),
              label: "Map"),
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home"),
          NavigationDestination(
              icon: Icon(Icons.settings),
              selectedIcon: Icon(Icons.settings),
              label: "Setting"),
        ],
      ),
    );
  }
}
