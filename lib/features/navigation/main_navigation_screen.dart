import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/navigation/widgets/navigation_tab.dart';
import 'package:tictok_app/features/navigation/widgets/post_video_button.dart';
import 'package:tictok_app/features/videos/timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  void onNavigationTap(int tapIndex) {
    setState(() {
      _currentIndex = tapIndex;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Record Screen')),
            ),
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _currentIndex != 0,
          child: TimelineScreen(),
        ),
        Offstage(
          offstage: _currentIndex != 1,
          child: Container(),
        ),
        Offstage(
          offstage: _currentIndex != 3,
          child: Container(),
        ),
        Offstage(
          offstage: _currentIndex != 4,
          child: Container(),
        ),
      ]),
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
            Gaps.h24,
            GestureDetector(
                onTap: _onPostVideoButtonTap, child: PostVideoButton()),
            Gaps.h24,
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
