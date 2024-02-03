import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Sizes.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Direct Message'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
          ),
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                child: Text('네로'),
                foregroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/68673384?s=40&v=4'),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lynn',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '2:17pm',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: Sizes.size12,
                    ),
                  ),
                ],
              ),
              subtitle: Text('last messsage blablalbl'),
            )
          ]),
    );
  }
}
