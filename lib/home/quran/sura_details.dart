import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/home/commonWidget/seperated_widget.dart';
import 'package:islamy_app/home/quran/dataClassSura.dart';
import 'package:islamy_app/home/quran/sura_content.dart';

class SuraDetailes extends StatefulWidget {
  static const String routeName = 'SuraDetailes';

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {
  List<String> ayatQuran = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as DataClassSura;
    if (ayatQuran.isEmpty) readFile(args.index);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background_image.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
          centerTitle: true,
        ),
        body: (ayatQuran.isEmpty)
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: ListView.separated(
                  itemBuilder: (_, index) {
                    return SuraContentWidget(ayatQuran[index], index);
                  },
                  itemCount: ayatQuran.length,
                  separatorBuilder: (_, index) {
                    return SeperatedLine();
                  },
                ),
              ),
      ),
    );
  }

  void readFile(int index) async {
    String contant =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    // trim => remove leading and trailing space '' '\n' '\t'
    List<String> lines = contant.trim().split('\r\n');
    ayatQuran = lines;
    setState(() {});
  }
}
