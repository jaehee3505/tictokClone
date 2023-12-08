import 'package:flutter/material.dart';
import 'package:tictok_app/authentication/sign_up.dart';
import 'package:tictok_app/constants/Sizes.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
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
          primaryColor: const Color(0xFFE9435A),
          scaffoldBackgroundColor: Colors.white),
      home: SignUpScreen(),
    );
  }
}
