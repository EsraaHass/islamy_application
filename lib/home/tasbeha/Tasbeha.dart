import 'package:flutter/material.dart';
import 'package:islamy_app/home/my_theme.dart';
import 'package:islamy_app/home/providers/settingsProvider.dart';
import 'package:provider/provider.dart';

class Tasbeha extends StatefulWidget {
  @override
  State<Tasbeha> createState() => _TasbehaState();
}

class _TasbehaState extends State<Tasbeha> {
  double angle = 0;
  int counter = 0;
  int currentIndex = 0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله أكبر'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var provider = Provider.of<SettingProviders>(context);
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                height: size.height * .5,
                child: Stack(
                  children: [
                    Positioned(
                      child: provider.isDarkMode()
                          ? Image.asset('assets/images/head_sebha_dark.png')
                          : Image.asset('assets/images/head_sebha_logo.png'),
                      left: size.width * .48,
                    ),
                    Positioned(
                      child: InkWell(
                        onTap: onPressed,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        child: Transform.rotate(
                          angle: angle,
                          child: provider.isDarkMode()
                              ? Image.asset('assets/images/body_sebha_dark.png')
                              : Image.asset(
                                  'assets/images/body_sebha_logo.png'),
                        ),
                      ),
                      top: 70,
                      left: size.width * .21,
                      right: size.width * .21,
                    ),
                  ],
                ),
              ),
              Text(
                'عدد التسبيحات',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                alignment: Alignment.center,
                width: 70,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: provider.isDarkMode()
                        ? MyTheme.colorYellow
                        : MyTheme.colorGold),
                child: Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color:
                            provider.isDarkMode() ? Colors.black : Colors.white,
                      ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 137,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: provider.isDarkMode()
                        ? MyTheme.colorYellow
                        : MyTheme.colorGold),
                child: Text(
                  '${azkar[currentIndex]}',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          provider.isDarkMode() ? Colors.black : Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void onPressed() {
    angle -= 2;
    counter++;
    if (counter == 34) {
      currentIndex++;
      counter = 0;
    }
    if (currentIndex > azkar.length - 1) {
      currentIndex = 0;
    }
    setState(() {});
  }
}
