import 'package:flutter/material.dart';
import 'package:islamy_app/Hadeth.dart';
import 'package:islamy_app/Quran.dart';
import 'package:islamy_app/Radio.dart';
import 'package:islamy_app/Tasbeha.dart';
import 'package:islamy_app/my_color.dart';

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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Islamy',
            style: TextStyle(
                fontSize: 26, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
              canvasColor: MyColor.primaryColor
          ),
          child: BottomNavigationBar(
            currentIndex: selectedTabIndex,
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            selectedIconTheme: const IconThemeData(
                color: Colors.black
            ),
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_radio.png'),
                  ),
                  label: 'Radio'
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_sebha.png'),
                  ),
                  label: 'Sebha'
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/icon_hadeth.png'),
                  ),
                  label: 'Hadeth'
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/images/quran.png'),
                  ),
                  label: 'Quran'
              ),
            ],
          ),
        ),

        body: tabsPages[selectedTabIndex],
      ),
    );
  }

  List<Widget> tabsPages = [Radios(), Tasbeha(), Hadeth(), Quran()];
}
