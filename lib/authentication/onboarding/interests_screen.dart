import 'package:flutter/material.dart';
import 'package:tictok_app/authentication/widgets/form_button.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class InterestsScreen extends StatelessWidget {
  const InterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const interests = [
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Text('Choose your interests'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your interests',
                style: TextStyle(
                    fontSize: Sizes.size40, fontWeight: FontWeight.bold),
              ),
              Gaps.v20,
              Text('Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  )),
              Gaps.v10,
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  for (var interest in interests)
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                        horizontal: Sizes.size24,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                spreadRadius: 5),
                          ]),
                      child: Text('$interest'),
                    )
                ],
              ),
              Gaps.v40,
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        padding: EdgeInsets.only(
            top: Sizes.size12,
            bottom: Sizes.size40,
            left: Sizes.size20,
            right: Sizes.size20),
        height: 110,
        child: Container(
          alignment: Alignment.center,
          color: Theme.of(context).primaryColor,
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: Sizes.size14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
