import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/screens/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.v52,
                  Text(
                    'Sign up for TicTok',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v24,
                  Text(
                    'Create a profile, follow other accounts, make your own videos, and more.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gaps.v40,
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              color: Colors.grey.shade100,
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => onLoginTap(context),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
