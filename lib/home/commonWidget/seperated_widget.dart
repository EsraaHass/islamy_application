import 'package:flutter/material.dart';

class SeperatedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 2,
      color: Theme.of(context).primaryColor,
      margin: EdgeInsets.symmetric(horizontal: 40),
    );
  }
}
