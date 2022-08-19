import 'package:flutter/material.dart';

class MyTheme {
  static const Color colorGold = Color(0xFFB7935F);
  static const Color colorYellow = Color(0xFFFACC10);
  static const Color colorDarkBlue = Color(0xFF141A2E);
  static final ThemeData lightTheme = ThemeData(
      primaryColor: colorGold,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(fontSize: 26, color: Colors.black),
        headline5: TextStyle(fontSize: 24, color: Colors.black),
        bodyText1: TextStyle(fontSize: 18, color: Colors.black),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorGold,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static final ThemeData darkTheme = ThemeData(
      primaryColor: colorYellow,
      backgroundColor: colorDarkBlue,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(fontSize: 26, color: Colors.white),
        headline5: TextStyle(fontSize: 24, color: Colors.white),
        bodyText1: TextStyle(fontSize: 18, color: Colors.white),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorDarkBlue,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: colorDarkBlue,
        selectedIconTheme: IconThemeData(color: colorYellow),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: colorYellow,
        selectedLabelStyle: TextStyle(color: colorYellow),
        unselectedItemColor: Colors.white,
      ));
}
