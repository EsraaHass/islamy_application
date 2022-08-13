import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
  static const Color primaryColor = Color(0xFFB7935F);
}
