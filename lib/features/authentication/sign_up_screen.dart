import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

import 'package:tictok_app/features/authentication/login_screen.dart';
import 'package:tictok_app/features/authentication/username_screen.dart';
import 'package:tictok_app/features/authentication/widgets/authButton.dart';
import 'package:tictok_app/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    print('버튼 클릭');
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => UsernameScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        // if (orientation == Orientation.landscape) {
        //   return Scaffold(
        //     body: Center(child: Text('Plz rotate ur phone')),
        //   );
        // }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.v52,
                  Text(
                    'Sign Up for TicTok',
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v24,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      'Create a profile, follow other accounts, make your own videos, and more.',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        // color: isDarkMode(context)
                        //     ? Colors.grey.shade300
                        //     : Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    AuthButton(
                      onTap: () => _onEmailTap(context),
                      buttonTitle: 'Use email & password',
                      buttonIcon: FaIcon(
                        FontAwesomeIcons.user,
                      ),
                    ),
                    Gaps.v14,
                    AuthButton(
                      onTap: () {},
                      buttonTitle: 'Continue with Apple',
                      buttonIcon: FaIcon(
                        FontAwesomeIcons.apple,
                      ),
                    ),
                  ],
                  if (orientation == Orientation.landscape) ...[
                    Row(
                      children: [
                        Expanded(
                          child: AuthButton(
                            onTap: () => _onEmailTap(context),
                            buttonTitle: 'Use email & password',
                            buttonIcon: FaIcon(
                              FontAwesomeIcons.user,
                            ),
                          ),
                        ),
                        Gaps.h14,
                        Expanded(
                          child: AuthButton(
                            onTap: () {},
                            buttonTitle: 'Continue with Apple',
                            buttonIcon: FaIcon(
                              FontAwesomeIcons.apple,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            //color: Colors.grey.shade50,
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
                  onTap: () => _onLoginTap(context),
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
            ),
          ),
        );
      }),
    );
  }
}
