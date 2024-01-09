import 'package:flutter/material.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/onboarding/tutorial_screen.dart';
import 'package:tictok_app/features/onboarding/widgets/interest_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100 && !_showTitle) {
      setState(() {
        _showTitle = true;
        print('${_scrollController.offset}');
      });
    } else {
      if (_showTitle) {
        setState(() {
          _showTitle = false;
          print('${_scrollController.offset}');
        });
      }
    }
  }

  void _onNextTap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TutorialScreen()));
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        title: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _showTitle ? 1 : 0,
            child: Text('Choose your interests')),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
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
                      InterestButton(interest: interest)
                  ],
                ),
                Gaps.v40,
              ],
            ),
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
        child: GestureDetector(
          onTap: _onNextTap,
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
      ),
    );
  }
}
