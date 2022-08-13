import 'package:flutter/material.dart';
import 'package:islamy_app/home/homeScreen.dart';
import 'package:islamy_app/home/my_theme.dart';
import 'package:islamy_app/home/quran/sura_details.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: MyTheme.lightTheme,
    initialRoute: HomeScreen.routeName,
    routes: {
      HomeScreen.routeName: (_) => HomeScreen(),
      SuraDetailes.routeName: (_) => SuraDetailes(),
    },
  ));
}
