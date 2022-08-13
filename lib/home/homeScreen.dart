import 'package:flutter/material.dart';
import 'package:islamy_app/home/hadeth/Hadeth.dart';
import 'package:islamy_app/home/quran/Quran.dart';
import 'package:islamy_app/home/radio/Radio.dart';
import 'package:islamy_app/home/tasbeha/Tasbeha.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/background_image.png'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'اسلامي',
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: Theme.of(context).primaryColor),
          child: BottomNavigationBar(
            currentIndex: selectedTabIndex,
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                  label: 'Quran'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label: 'Radio'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: 'Sebha'),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: 'Hadeth'),
            ],
          ),
        ),
        body: tabsPages[selectedTabIndex],
      ),
    );
  }

  List<Widget> tabsPages = [
    Quran(),
    Radios(),
    Tasbeha(),
    HadethTab(),
  ];
}
