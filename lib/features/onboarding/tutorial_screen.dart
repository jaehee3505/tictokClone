import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/utils.dart';

import '../main_navigation/main_navigation_screen.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _MyWidgetState();
}

/*
                    Text(
                      'Watch cool videos!',
                      style: TextStyle(
                          fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch, like, and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )

*/

enum SwipeDirection { right, left }

enum PageLocation { first, second }

class _MyWidgetState extends State<TutorialScreen> {
  SwipeDirection swipeDirection = SwipeDirection.right;
  PageLocation showInPage = PageLocation.first;
  void _onPenUpdate(DragUpdateDetails details) {
    if (details.delta.dx > 0) {
      setState(() {
        swipeDirection = SwipeDirection.right;
        print('왼쪽으로 스와이프');
      });
    } else {
      setState(() {
        swipeDirection = SwipeDirection.left;
        print('오른쪽으로 스와이프');
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MainNavigationScreen()),
        (route) => false);
  }

  void _onPenEnd(DragEndDetails details) {
    if (swipeDirection == SwipeDirection.right) {
      setState(() {
        print('두 번째 페이지 노출');
        showInPage = PageLocation.first;
      });
    } else {
      setState(() {
        print('첫 번째 페이지 노출');
        showInPage = PageLocation.second;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPenUpdate,
      onPanEnd: _onPenEnd,
      child: Scaffold(
        body: SafeArea(
          child: AnimatedCrossFade(
            firstChild: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      'Watch cool videos!',
                      style: TextStyle(
                          fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                    ),
                    Gaps.v16,
                    Text(
                      'Videos are personalized for you based on what you watch, like, and share.',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
            ),
            secondChild: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v40,
                    Text(
                      'Follow the rules',
                      style: TextStyle(
                          fontSize: Sizes.size40, fontWeight: FontWeight.bold),
                    ),
                    Gaps.v16,
                    Text(
                      'Take car of one another! Plis!',
                      style: TextStyle(
                        fontSize: Sizes.size20,
                      ),
                    )
                  ]),
            ),
            crossFadeState: showInPage == PageLocation.first
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Duration(milliseconds: 300),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: isDarkMode(context) ? Colors.black : Colors.white,
          height: Sizes.size56 + Sizes.size36,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: showInPage == PageLocation.first ? 0 : 1,
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              child: Text('Enter the app!'),
              onPressed: _onEnterAppTap,
            ),
          ),
        ),
      ),
    );
  }
}
