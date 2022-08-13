import 'package:flutter/material.dart';

class SuraContentWidget extends StatelessWidget {
  String content;
  int index;

  SuraContentWidget(this.content, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        alignment: Alignment.center,
        child: Text(
          '$content{${index + 1}}',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }
}
