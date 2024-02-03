import 'package:flutter/material.dart';

import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/inbox/activity_screen.dart';
import 'package:tictok_app/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_app/features/onboarding/interests_screen.dart';

void main() {
  runApp(
    const TicTokApp(),
  );
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          splashColor: Colors.transparent, // 스플레시 효과 사라짐
          // highlightColor: Colors.transparent, // 버튼 눌렀을때 물감혀과 사라짐
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.black,
            selectionColor: Colors.grey,
          ),
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16 + Sizes.size2,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.white,
            elevation: 0,
          ),
          primaryColor: const Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white),
      home: MainNavigationScreen(), //SignUpScreen(),
    );
  }
}
