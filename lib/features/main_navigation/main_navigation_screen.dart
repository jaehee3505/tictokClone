import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/features/discover/discover.dart';
import 'package:tictok_app/features/inbox/inbox_screen.dart';
import 'package:tictok_app/features/main_navigation/widgets/navigation_tab.dart';
import 'package:tictok_app/features/main_navigation/widgets/post_video_button.dart';
import 'package:tictok_app/features/users/user_profile_screen.dart';
import 'package:tictok_app/features/videos/timeline_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 4;

  void onNavigationTap(int tapIndex) {
    setState(() {
      _selectedIndex = tapIndex;
    });
  }

  void _onPostVideoButtonTap() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(title: Text('Record Screen')),
            ),
        fullscreenDialog: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _selectedIndex == 0 ? Colors.black : Colors.white,
      body: Stack(children: [
        Offstage(
          offstage: _selectedIndex != 0,
          child: TimelineScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 1,
          child: DiscoverScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 3,
          child: InboxScreen(),
        ),
        Offstage(
          offstage: _selectedIndex != 4,
          child: UserProfileScreen(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        color: _selectedIndex == 0 ? Colors.black : Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavigationTap(
                onTap: () => onNavigationTap(0),
                icon: FontAwesomeIcons.house,
                isSelectedIcon: FontAwesomeIcons.house,
                text: 'Home',
                isSelected: (_selectedIndex == 0),
                selectedIndex: _selectedIndex),
            NavigationTap(
                onTap: () => onNavigationTap(1),
                icon: FontAwesomeIcons.compass,
                isSelectedIcon: FontAwesomeIcons.solidCompass,
                text: 'Search',
                isSelected: (_selectedIndex == 1),
                selectedIndex: _selectedIndex),
            Gaps.h24,
            GestureDetector(
                onTap: _onPostVideoButtonTap,
                child: PostVideoButton(inverted: _selectedIndex == 0)),
            Gaps.h24,
            NavigationTap(
                onTap: () => onNavigationTap(3),
                icon: FontAwesomeIcons.message,
                isSelectedIcon: FontAwesomeIcons.solidMessage,
                text: 'Inbox',
                isSelected: (_selectedIndex == 3),
                selectedIndex: _selectedIndex),
            NavigationTap(
                onTap: () => onNavigationTap(4),
                icon: FontAwesomeIcons.user,
                isSelectedIcon: FontAwesomeIcons.solidUser,
                text: 'Profile',
                isSelected: (_selectedIndex == 4),
                selectedIndex: _selectedIndex),
          ],
        ),
      ),
    );
  }
}
