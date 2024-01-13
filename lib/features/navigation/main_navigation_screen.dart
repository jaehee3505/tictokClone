import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/features/navigation/widgets/navigation_tab.dart';

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
    Center(
      child: Text('Center'),
    ),
    Center(
      child: Text('Inbox'),
    ),
    Center(
      child: Text('Profile'),
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
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationTap(
                onTap: () => onNavigationTap(0),
                icon: FontAwesomeIcons.house,
                isSelectedIcon: FontAwesomeIcons.house,
                text: 'Home',
                isSelected: (_currentIndex == 0)),
            NavigationTap(
                onTap: () => onNavigationTap(1),
                icon: FontAwesomeIcons.compass,
                isSelectedIcon: FontAwesomeIcons.solidCompass,
                text: 'Search',
                isSelected: (_currentIndex == 1)),
            NavigationTap(
                onTap: () => onNavigationTap(3),
                icon: FontAwesomeIcons.message,
                isSelectedIcon: FontAwesomeIcons.solidMessage,
                text: 'Inbox',
                isSelected: (_currentIndex == 3)),
            NavigationTap(
                onTap: () => onNavigationTap(4),
                icon: FontAwesomeIcons.user,
                isSelectedIcon: FontAwesomeIcons.solidUser,
                text: 'Profile',
                isSelected: (_currentIndex == 4)),
          ],
        ),
      ),
    );
  }
}