import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../providers/ThemeNotifier.dart';
import '../utils/constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _loadTheme();
    _loadColor();
  }

  // Method to load the current theme setting (light or dark)
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String currentTheme = prefs.getString('theme') ?? LIGHT_THEME;
    Provider.of<ThemeNotifier>(context, listen: false).setTheme(currentTheme);
  }

  // Method to load the selected color from SharedPreferences
  Future<void> _loadColor() async {
    final prefs = await SharedPreferences.getInstance();
    int colorIndex = prefs.getInt('color') ?? 0;
    setState(() {
      _selectedColor = _getColorByIndex(colorIndex);
    });
  }

  // Method to change the theme (light/dark mode)
  Future<void> _changeTheme() async {
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

  // Method to update the selected color
  Future<void> _changeColor(Color color, int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('color', index); // Save the color index
    setState(() {
      _selectedColor = color;
    });

    // Update the color in the app's theme
    Provider.of<ThemeNotifier>(context, listen: false).setColor(color);
  }

  // Helper method to get a color by its index
  Color _getColorByIndex(int index) {
    switch (index) {
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          // Dark Mode Toggle
          ListTile(
            title: Text('Dark Mode'),
            trailing: Icon(Icons.color_lens),
            onTap: () {
              _changeTheme();
            },
          ),
          // Color Plate Selection
          ListTile(
            title: Text('Select Theme Color'),
            subtitle: Text('Choose a color for the app theme'),
          ),
          _buildColorPlateRow(),
        ],
      ),
    );
  }

  // Helper method to build the color plate row
  Widget _buildColorPlateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildColorPlate(Colors.orange, 0),
        _buildColorPlate(Colors.blue, 1),
        _buildColorPlate(Colors.green, 2),
        _buildColorPlate(Colors.red, 3),
      ],
    );
  }

  // Helper method to build individual color plate tiles
  Widget _buildColorPlate(Color color, int index) {
    return GestureDetector(
      onTap: () => _changeColor(color, index),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 30,
        child: _selectedColor == color
            ? Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}
