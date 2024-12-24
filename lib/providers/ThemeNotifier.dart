import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/themes.dart';

class ThemeNotifier extends ChangeNotifier {
  // Initial theme and color
  ThemeData _currentTheme = lightTheme;

  // Get the current theme
  ThemeData get getTheme => _currentTheme;

  // Color properties for dynamic color changes
  Color appBarColor = Colors.blueAccent;
  Color drawerHeaderColor = Colors.blueAccent;
  Color iconColor = Colors.white;
  Color listTileTextColor = Colors.black; // Add color property for text
  Color listTileIconColor = Colors.blueAccent; // Add color property for icon

  // Set the theme (light or dark)
  void setTheme(String theme) {
    if (theme == DARK_THEME) {
      _currentTheme = darkTheme.copyWith(
        primaryColor: Colors.orange, // Or your dynamic color
      );
      appBarColor = Colors.grey[850]!;
      drawerHeaderColor = Colors.grey[850]!;
      iconColor = Colors.white;
      listTileTextColor = Colors.white; // Set text color for ListTile in dark theme
      listTileIconColor = Colors.blueAccent; // Set icon color for ListTile in dark theme
    } else {
      _currentTheme = lightTheme.copyWith(
        primaryColor: Colors.orange, // Or your dynamic color
      );
      appBarColor = Colors.blueAccent;
      drawerHeaderColor = Colors.blueAccent;
      iconColor = Colors.white;
      listTileTextColor = Colors.blue; // Set text color for ListTile in dark theme
      listTileIconColor = Colors.blue; // Set icon color for ListTile in dark theme
    }
    notifyListeners();
  }

  // Set the primary color and update AppBar, Drawer, and Icon colors
  void setColor(Color color) {
    _currentTheme = _currentTheme.copyWith(
      primaryColor: color,
    );
    appBarColor = color;
    drawerHeaderColor = color;
    iconColor = color; // You can adjust this color based on your needs
    listTileTextColor = color;
    listTileIconColor = color;
    notifyListeners();
  }
}
