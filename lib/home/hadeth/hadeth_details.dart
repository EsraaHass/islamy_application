import 'package:flutter/material.dart';
import 'package:islamy_app/home/hadeth/dataClassHadeth.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'HadethDetails';

  String title;

  int index;

  HadethDetails(this.title, this.index);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ContentHadethData;

    return Container();
  }
}
