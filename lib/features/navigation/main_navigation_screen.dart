import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/navigation/widgets/navigation_tab.dart';
import 'package:tictok_app/features/navigation/widgets/post_video_button.dart';
import 'package:tictok_app/features/navigation/widgets/stf_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  late double _scale;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.2,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

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

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Offstage(
          offstage: _currentIndex != 0,
          child: StfScreen(),
        ),
        Offstage(
          offstage: _currentIndex != 1,
          child: StfScreen(),
        ),
        Offstage(
          offstage: _currentIndex != 3,
          child: StfScreen(),
        ),
        Offstage(
          offstage: _currentIndex != 4,
          child: StfScreen(),
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
                onTapUp: _tapUp,
                onTapDown: _tapDown,
                onTap: _onPostVideoButtonTap,
                child:
                    Transform.scale(scale: _scale, child: PostVideoButton())),
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
