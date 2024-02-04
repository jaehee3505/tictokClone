import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/authentication/sign_up_screen.dart';
import 'package:tictok_app/features/inbox/activity_screen.dart';
import 'package:tictok_app/features/main_navigation/main_navigation_screen.dart';
import 'package:tictok_app/features/onboarding/interests_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  runApp(
    const TicTokApp(),
  );
}

const String MYGITHUBIMAGE =
    'https://avatars.githubusercontent.com/u/68673384?s=40&v=4';

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          brightness: Brightness.light,
          textTheme: Typography.blackMountainView,
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
            color: Colors.grey.shade50,
            elevation: 0,
          ),
          primaryColor: const Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white),

      darkTheme: ThemeData(
        textTheme: Typography.whiteMountainView,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade900,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
      home: SignUpScreen(), //MainNavigationScreen()
    );
  }
}
