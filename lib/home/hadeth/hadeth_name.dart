import 'package:flutter/material.dart';
import 'package:islamy_app/home/hadeth/Hadeth.dart';
import 'package:islamy_app/home/hadeth/hadeth_details.dart';

class HadethTitleWidget extends StatelessWidget {
  Hadeth hadeth;

  HadethTitleWidget(this.hadeth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadethDetailsScreen.routeName,
            arguments: hadeth);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          hadeth.title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}