import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onXmarkTap() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: _onXmarkTap, icon: FaIcon(FontAwesomeIcons.xmark)),
          ],
          title: Text('22793 comments'),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Gaps.v20,
          padding: EdgeInsets.symmetric(
              vertical: Sizes.size10, horizontal: Sizes.size16),
          itemCount: 10,
          itemBuilder: (context, index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 18,
                child: Text('네로'),
              ),
              Gaps.h10,
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('네로',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size14,
                        color: Colors.grey.shade500,
                      )),
                  Gaps.v3,
                  Text('sdfsdfdsfsdfsdfdsfsdfdsfdssdfsdfsdfsfsdfsf'),
                ],
              )),
              Gaps.v10,
              Column(
                children: [
                  FaIcon(
                    FontAwesomeIcons.heart,
                    size: Sizes.size20,
                    color: Colors.grey.shade500,
                  ),
                  Gaps.v2,
                  Text(
                    '62.2k',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(children: [
            CircleAvatar(
              radius: 18,
              child: Text('네로'),
              backgroundColor: Colors.grey.shade500,
              foregroundColor: Colors.white,
            )
          ]),
        ),
      ),
    );
  }
}
