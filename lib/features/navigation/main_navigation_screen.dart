import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
  ];

  void onNavigationTap(int tapIndex) {
    setState(() {
      _currentIndex = tapIndex;
      print('_currentIndex = $_currentIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: onNavigationTap,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.house), label: 'house'),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: 'search'),
          ],
        ));
  }
}
