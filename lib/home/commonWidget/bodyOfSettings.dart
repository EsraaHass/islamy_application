import 'package:flutter/material.dart';

class BodyOfSettings extends StatelessWidget {
  String themetext;

  Color color;

  TextStyle? text;

  BodyOfSettings(this.themetext, this.color, {this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
      child: Text('$themetext', style: text),
    );
  }
}
