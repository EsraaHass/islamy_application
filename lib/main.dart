import 'package:flutter/material.dart';
import 'package:islamy_app/homeScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: HomeScreen.routeName,
    routes: {
      HomeScreen.routeName: (_) => HomeScreen(),
    },
  ));
}
