import 'package:flutter/material.dart';
import 'package:islamy_app/home/hadeth/Hadeth.dart';
import 'package:islamy_app/home/providers/settingsProvider.dart';
import 'package:provider/provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeth-details';

  @override
  Widget build(BuildContext context) {
    var hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;
    var settingProvders = Provider.of<SettingProviders>(context);

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(settingProvders.getMainBackGroundColor()),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(hadeth.title),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(vertical: 64, horizontal: 12),
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ));
  }
}