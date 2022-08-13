import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/home/commonWidget/logoWidget.dart';
import 'package:islamy_app/home/commonWidget/seperated_widget.dart';
import 'package:islamy_app/home/hadeth/hadeth_name.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) loadHadethData();
    return Column(
      children: [
        LogoWidget('assets/images/hadeth_logo.png', 'الأحاديث'),
        Expanded(
          child: Container(
            child: hadethList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (_, index) {
                      return HadethTitleWidget(hadethList[index]);
                    },
                    separatorBuilder: (_, index) => SeperatedLine(),
                    itemCount: hadethList.length,
                  ),
          ),
        ),
      ],
    );
  }

  void loadHadethData() async {
    List<Hadeth> mHadethList = [];
    String content = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allHadeth = content.trim().split("#");
    for (int i = 0; i < allHadeth.length; i++) {
      String singleHadethContent = allHadeth[i];
      List<String> hadethLines = singleHadethContent.trim().split("\n");
      String title = hadethLines[0];
      if (title.isEmpty) continue;
      hadethLines.removeAt(0);
      String content = hadethLines.join("\n");
      Hadeth h = Hadeth(title, content);
      mHadethList.add(h);
    }
    this.hadethList = mHadethList;
    setState(() {});
  }
}

class Hadeth {
  String title;
  String content;

  Hadeth(this.title, this.content);
}