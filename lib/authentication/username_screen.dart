import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class EmailScreen extends StatefulWidget {
  EmailScreen({super.key});

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
          FractionallySizedBox(
            widthFactor: 1,
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: username.isEmpty
                    ? Colors.grey
                    : Theme.of(context).primaryColor,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size10,
              ),
              child: Text('Next',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
