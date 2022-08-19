import 'package:flutter/material.dart';

class SettingProviders extends ChangeNotifier {
  String currentLan = 'en';
  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLan) {
    if (currentLan == newLan) return;
    currentLan = newLan;
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
