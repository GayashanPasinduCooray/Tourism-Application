import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/ThemeNotifier.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/constants.dart';
import 'providers/news_provider.dart'; // Import NewsProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences to get the current theme
  final prefs = await SharedPreferences.getInstance();
  String theme = prefs.getString('theme') ?? LIGHT_THEME;

  runApp(MyApp(initialTheme: theme));
}

class MyApp extends StatelessWidget {
  final String initialTheme;

  MyApp({required this.initialTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeNotifier()..setTheme(initialTheme), // Provide ThemeNotifier
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(), // Provide NewsProvider to the app
        ),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, child) {
          return MaterialApp(
            title: 'Travel & Tourism in Sri Lanka',
            theme: themeNotifier.getTheme, // Apply the selected theme
            home: HomeScreen(), // Set your HomeScreen as the home
            debugShowCheckedModeBanner: false,
            routes: {
              '/settings': (context) => SettingsScreen(), // Add route for SettingsScreen
            },
          );
        },
      ),
    );
  }
}
