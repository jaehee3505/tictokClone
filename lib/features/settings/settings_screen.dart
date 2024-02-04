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
            onTap: () => showAboutDialog(
                context: context,
                applicationVersion: '1.0',
                applicationLegalese: 'all rightss'),
            title: Text(
              'aoube',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text('about this app...'),
          ),
          AboutListTile(),
        ],
      ),
    );
  }
}
