import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
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
