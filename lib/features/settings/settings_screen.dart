import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          AboutListTile(),
        ],
      ),
    );
  }
}
