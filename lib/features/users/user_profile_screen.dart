import 'package:flutter/material.dart';

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
          //floating: true,
          stretch: true,
          pinned: true, //타이틀은 안사라지게 함
          backgroundColor: Colors.teal,
          elevation: 1,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground,
              ],
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              title: Text('hello'),
              centerTitle: true,
              background: Image.asset(
                'assets/images/sample.png',
                fit: BoxFit.cover,
              )),
        ),
        SliverFixedExtentList(
          // 위로 땡겼을때 줄어들게 해주는 것 추가
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(),
          ),
          itemExtent: 1,
        ),
      ],
    );
  }
}
