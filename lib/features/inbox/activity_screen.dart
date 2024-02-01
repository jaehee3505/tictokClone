import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tictok_app/constants/Gaps.dart';
import 'package:tictok_app/constants/Sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final List<String> _notifications = List.generate(20, (index) => '${index}h');

  void _onDismissed(String notification) {
    _notifications.remove(notification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All activity')),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          child: Text(
            'New',
            style:
                TextStyle(fontSize: Sizes.size14, color: Colors.grey.shade400),
          ),
        ),
        Gaps.v14,
        for (var notification in _notifications)
          Dismissible(
            onDismissed: (direction) => _onDismissed(notification),
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.green,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Sizes.size10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.checkDouble,
                  color: Colors.white,
                  size: Sizes.size32,
                ),
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Padding(
                padding: EdgeInsets.only(
                  right: Sizes.size10,
                ),
                child: FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.white,
                  size: Sizes.size32,
                ),
              ),
            ),
            key: Key(notification),
            child: ListTile(
              minVerticalPadding: Sizes.size16,
              leading: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: Sizes.size1,
                  ),
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                width: Sizes.size52,
                child: Center(
                    child: FaIcon(
                  FontAwesomeIcons.bell,
                  color: Colors.black,
                )),
              ),
              title: RichText(
                text: TextSpan(
                    text: 'Account updates',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                          text: 'sub title sdfsdfdsfsdfds',
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      TextSpan(
                          text: '${notification}',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ))
                    ]),
              ),
              trailing: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size16,
              ),
            ),
          )
      ]),
    );
  }
}
