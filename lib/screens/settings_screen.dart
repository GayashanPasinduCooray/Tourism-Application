// lib/screens/settings_screen.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../providers/ThemeNotifier.dart';
import '../utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(value: true, onChanged: (value) {}),
          ),
          ListTile(
            title: Text('Language'),
            trailing: Icon(Icons.language),
            onTap: () {},
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Icon(Icons.color_lens),
            onTap: () {
              _changeTheme(context);
            },
          ),
        ],
      ),
    );
  }

  // Method to toggle between light and dark themes
  Future<void> _changeTheme(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String currentTheme = prefs.getString('theme') ?? LIGHT_THEME;

    // Toggle theme
    if (currentTheme == LIGHT_THEME) {
      prefs.setString('theme', DARK_THEME);
      Provider.of<ThemeNotifier>(context, listen: false).setTheme(DARK_THEME);
    } else {
      prefs.setString('theme', LIGHT_THEME);
      Provider.of<ThemeNotifier>(context, listen: false).setTheme(LIGHT_THEME);
    }
  }
}
