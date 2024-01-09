import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/authentication/password_screen.dart';
import 'package:tictok_app/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  TextEditingController emailController = TextEditingController();
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {
        email = emailController.text;
      });
    });
  }

  String? isEmailValid() {
    if (email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return 'Invalid Email';
    }
    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onPasswordTap() {
    if (email.isNotEmpty && (isEmailValid() == null)) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => PasswordScreen()));
    } else {
      return;
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
            Text('What is your email?',
                style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            Gaps.v10,
            TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                errorText: isEmailValid(),
                hintText: 'Email',
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
            Gaps.v20,
            FormButton(
              text: 'Next',
              onTap: onPasswordTap,
              isDisable: !(email.isNotEmpty && (isEmailValid() == null)),
            )
          ]),
        ),
      ),
    );
  }
}
