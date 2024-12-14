import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/themes.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = lightTheme;

  ThemeData get getTheme => _currentTheme;

  void setTheme(String theme) {
    if (theme == DARK_THEME) {
      _currentTheme = darkTheme;
    } else {
      _currentTheme = lightTheme;
    }
    notifyListeners();
  }
}
