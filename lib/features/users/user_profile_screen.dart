import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';
import 'package:tictok_app/main.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(), //아래로 스크롤시 땡겨지는 것 추가
      slivers: [
        SliverAppBar(
          title: Text('네로'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.gear,
                  size: Sizes.size20,
                )),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(children: [
            CircleAvatar(
              radius: 50,
              foregroundColor: Colors.teal,
              foregroundImage: NetworkImage(MYGITHUBIMAGE),
              child: Text('네로'),
            ),
            Gaps.v20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@네로',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size18,
                  ),
                ),
                Gaps.h5,
                FaIcon(
                  FontAwesomeIcons.solidCircleCheck,
                  size: Sizes.size18,
                  color: Colors.blue.shade500,
                ),
              ],
            ),
            Gaps.v24,
            SizedBox(
              height: Sizes.size56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UsersLikes(),
                  VerticalDivider(
                    width: Sizes.size32,
                    color: Colors.grey.shade400,
                    thickness: Sizes.size1,
                    indent: Sizes.size14,
                    endIndent: Sizes.size14,
                  ),
                  UsersLikes(),
                  VerticalDivider(
                    width: Sizes.size32,
                    color: Colors.grey.shade400,
                    thickness: Sizes.size1,
                    indent: Sizes.size14,
                    endIndent: Sizes.size14,
                  ),
                  UsersLikes(),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }

  Column UsersLikes() {
    return Column(
      children: [
        Text(
          '11297',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size18,
          ),
        ),
        Gaps.v3,
        Text('Likes',
            style: TextStyle(
              color: Colors.grey.shade500,
            ))
      ],
    );
  }
}
