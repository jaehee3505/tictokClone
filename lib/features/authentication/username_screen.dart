import 'package:flutter/material.dart';

import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/authentication/email_screen.dart';
import 'package:tictok_app/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<UsernameScreen> {
  TextEditingController usernameController = TextEditingController();
  String username = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.addListener(() {
      setState(() {
        username = usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onEmailTap() {
    if (username.isEmpty) return;

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EmailScreen()));
  }

  String? isUsernameValid() {
    if (username.isEmpty) return 'Invalid Username';
    return null;
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
            Text('Create username',
                style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Gaps.v5,
            Text(
              'You can always change this later',
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.v10,
            TextField(
              controller: usernameController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                  errorText: isUsernameValid(),
                  hintText: 'Username',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  )),
            ),
            Gaps.v20,
            FormButton(
              text: 'Next',
              onTap: onEmailTap,
              isDisable: username.isEmpty,
            )
          ]),
        ),
      ),
    );
  }
}
