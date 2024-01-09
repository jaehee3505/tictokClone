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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onNavigationTap,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              tooltip: 'home!',
              icon: FaIcon(FontAwesomeIcons.house),
              backgroundColor: Colors.amber,
              label: 'Home'),
          BottomNavigationBarItem(
              tooltip: 'search!',
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              backgroundColor: Colors.pink,
              label: 'Search'),
        ],
      ),
    );
  }
}
