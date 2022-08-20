import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProviders extends ChangeNotifier {
  String currentLan = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) async {
    final pref = await SharedPreferences.getInstance();

    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    pref.setString('theme', currentTheme == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }

  void changeLanguage(String newLan) async {
    final pref = await SharedPreferences.getInstance();

    if (currentLan == newLan) return;
    currentLan = newLan;
    pref.setString('lang', currentLan);
    notifyListeners();
  }

  bool isDarkMode() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackGroundColor() {
    return isDarkMode()
        ? 'assets/images/mainbackground_dark_bng.png'
        : 'assets/images/background_image.png';
  }
}
