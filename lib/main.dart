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
          textTheme: TextTheme(
            displayLarge: GoogleFonts.openSans(
                fontSize: 95, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            displayMedium: GoogleFonts.openSans(
                fontSize: 59, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            displaySmall:
                GoogleFonts.openSans(fontSize: 48, fontWeight: FontWeight.w400),
            headlineMedium: GoogleFonts.openSans(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headlineSmall:
                GoogleFonts.openSans(fontSize: 24, fontWeight: FontWeight.w400),
            titleLarge: GoogleFonts.openSans(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            titleMedium: GoogleFonts.openSans(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            titleSmall: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyLarge: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyMedium: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            labelLarge: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            bodySmall: GoogleFonts.roboto(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            labelSmall: GoogleFonts.roboto(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          ),
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
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFE9435A),
      ),
      home: SignUpScreen(), //MainNavigationScreen()
    );
  }
}
