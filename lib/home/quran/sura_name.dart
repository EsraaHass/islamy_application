import 'package:flutter/material.dart';
import 'package:islamy_app/home/quran/dataClassSura.dart';
import 'package:islamy_app/home/quran/sura_details.dart';

class SuraName extends StatelessWidget {
  String text;
  int index;

  SuraName(this.text, this.index);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailes.routeName,
            arguments: DataClassSura(index, text));
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
