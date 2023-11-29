import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/screens/sign_up.dart';

void main() {
  runApp(const TicTokApp());
}

class TicTokApp extends StatelessWidget {
  const TicTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFFE9435A),
      ),
      home: SignUpScreen(),
    );
  }
}
