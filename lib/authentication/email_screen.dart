import 'package:flutter/material.dart';
import 'package:tictok_app/authentication/widgets/form_button.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
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

  void onEmailTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => EmailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v20,
          Text('What is your email?',
              style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          Gaps.v10,
          TextField(
            controller: usernameController,
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
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
                )),
          ),
          Gaps.v20,
          FormButton(
            onTap: onEmailTap,
            isDisable: username.isEmpty,
          )
        ]),
      ),
    );
  }
}
