import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
              title: Text('listTile'),
              value: _notifications,
              onChanged: _onNotificationsChanged),
          CheckboxListTile(
            checkColor: Colors.white,
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text('Enable notifications'),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(1998),
                lastDate: DateTime(2030),
                initialDate: DateTime.now(),
              );
              print(date);
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
              final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1930),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      child: child!,
                      data: ThemeData(
                          appBarTheme: AppBarTheme(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.blue,
                      )),
                    );
                  });
              print(booking);
            },
            title: Text(
              'what is your birthday?',
            ),
            subtitle: Text('about this app...'),
          ),
          ListTile(
            title: Text('logout(IOS)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                          title: Text('Are you sure?'),
                          content: Text('please dont go'),
                          actions: [
                            CupertinoDialogAction(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text('No')),
                            CupertinoDialogAction(
                                onPressed: () => Navigator.of(context).pop(),
                                isDestructiveAction: true,
                                child: Text('Yes'))
                          ]));
            },
          ),
          ListTile(
            title: Text('logout(Android)'),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          icon: FaIcon(FontAwesomeIcons.safari),
                          title: Text('Are you sure?'),
                          content: Text('please dont go'),
                          actions: [
                            IconButton(
                                onPressed: () => Navigator.of(context).pop(),
                                icon: FaIcon(FontAwesomeIcons.car)),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Yes'),
                            )
                          ]));
            },
          ),
          ListTile(
            title: Text('logout(Ios/bottom)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                          message: Text('pleease dont go'),
                          title: Text('Are you sure?'),
                          actions: [
                            CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Not LogOut'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Yes Please'),
                              isDestructiveAction: true,
                            ),
                          ]));
            },
          ),
          ListTile(
            title: Text('logout(Ios/bottom)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                          message: Text('pleease dont go'),
                          title: Text('Are you sure?'),
                          actions: [
                            CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Not LogOut'),
                            ),
                            CupertinoActionSheetAction(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Yes Please'),
                              isDestructiveAction: true,
                            ),
                          ]));
            },
          ),
          AboutListTile(),
        ],
      ),
    );
  }
}
