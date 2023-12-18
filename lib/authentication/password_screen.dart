import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/authentication/birthday_screen.dart';
import 'package:tictok_app/authentication/widgets/form_button.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<PasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  String password = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController.addListener(() {
      setState(() {
        password = passwordController.text;
      });
    });
  }

  bool passwordVisible = false;
  bool isPasswordLength() {
    return (password.length >= 8) && (password.length <= 20);
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onTapClear() {
    setState(() {
      passwordController.clear();
      password = '';
    });
  }

  bool isPasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
    return passwordVisible;
  }

  void onBirthdayTap() {
    if (isPasswordLength()) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BirthdayScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v20,
            Text('Password',
                style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Gaps.v10,
            TextField(
              controller: passwordController,
              cursorColor: Theme.of(context).primaryColor,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: 'Make it Strong',
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: onTapClear,
                      child: FaIcon(
                        FontAwesomeIcons.circleXmark,
                        color: password.isEmpty ? Colors.grey : Colors.black,
                      ),
                    ),
                    Gaps.h5,
                    GestureDetector(
                        onTap: isPasswordVisible,
                        child: FaIcon(
                            passwordVisible
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey)),
                  ],
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  color: isPasswordLength() ? Colors.green : Colors.grey,
                  size: Sizes.size16,
                ),
                Gaps.h5,
                Text(
                  '8 to 20 characters',
                  style: TextStyle(
                    color: isPasswordLength() ? Colors.green : Colors.grey,
                    fontSize: Sizes.size16,
                  ),
                )
              ],
            ),
            Gaps.v20,
            FormButton(
              onTap: onBirthdayTap,
              isDisable: !isPasswordLength(),
            )
          ]),
        ),
      ),
    );
  }
}
