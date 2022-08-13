import 'package:flutter/material.dart';
import 'package:islamy_app/home/hadeth/dataClassHadeth.dart';
import 'package:islamy_app/home/hadeth/hadeth_details.dart';

class HadethName extends StatelessWidget {
  String text;
  int index;

  HadethName(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName,
            arguments: ContentHadethData(text, index));
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 6),
          alignment: Alignment.center,
          child: Text(
            '$text',
            style: Theme.of(context).textTheme.headline5,
          )),
    );
  }
}
