import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/home/commonWidget/logoWidget.dart';
import 'package:islamy_app/home/commonWidget/seperated_widget.dart';
import 'package:islamy_app/home/hadeth/dataClassHadeth.dart';
import 'package:islamy_app/home/hadeth/hadeth_name.dart';

class Hadeth extends StatefulWidget {
  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<DataClassHadeth> hadethList = [];

  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) readHadethOfFile();
    return Column(
      children: [
        LogoWidget('assets/images/hadeth_logo.png', 'الأحاديث'),
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return HadethName(hadethList[index].title, index);
            },
            itemCount: hadethList.length,
            separatorBuilder: (_, index) => SeperatedLine(),
          ),
        )
      ],
    );
  }

  void readHadethOfFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<DataClassHadeth> ahadethOfFiles = [];
    List<String> allHadeth = fileContent.trim().split('#');

    for (int i = 0; i < allHadeth.length; i++) {
      List<String> hadethLine = allHadeth[i].trim().split('\n');
      String title = hadethLine[0];
      if (title.isEmpty) continue;
      hadethLine.removeAt(0);
      String content = hadethLine.join('\n');
      DataClassHadeth h = DataClassHadeth(title, content);
      ahadethOfFiles.add(h);
    }
    hadethList = ahadethOfFiles;
    setState(() {});
  }
}
