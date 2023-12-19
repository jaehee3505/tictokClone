import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictok_app/authentication/email_screen.dart';
import 'package:tictok_app/authentication/onboarding/interests_screen.dart';
import 'package:tictok_app/authentication/widgets/form_button.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<BirthdayScreen> {
  DateTime initialBirthday = DateTime(
      DateTime.now().year - 4, DateTime.now().month, DateTime.now().day);
  TextEditingController birthdayController = TextEditingController();
  @override
  void initState() {
    datetimeToString(dateTime: initialBirthday);
    super.initState();
  }

  void datetimeToString({required DateTime dateTime}) {
    final String birthdayString = dateTime.toString().split(' ').first;
    birthdayController.value = TextEditingValue(text: birthdayString);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onBirthdayTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InterestsScreen(),
      ),
    );
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              Text(
                'When\'s your initialBirthday?',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Gaps.v5,
              Text(
                'Your initialBirthday won\'t be shown publicly.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v10,
              TextField(
                controller: birthdayController,
                enabled: false,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
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
                onTap: onBirthdayTap,
                isDisable: false,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 300,
          child: CupertinoDatePicker(
            maximumDate: initialBirthday,
            initialDateTime: initialBirthday,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              datetimeToString(dateTime: value);
            },
          ),
        ),
      ),
    );
  }
}
