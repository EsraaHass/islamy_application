import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/home/hadeth/hadeth_details.dart';
import 'package:islamy_app/home/homeScreen.dart';
import 'package:islamy_app/home/my_theme.dart';
import 'package:islamy_app/home/providers/settingsProvider.dart';
import 'package:islamy_app/home/quran/sura_details.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider<SettingProviders>(
      create: (buildContext) => SettingProviders(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingProviders settingsProvider;

  @override
  Widget build(BuildContext context) {
    settingsProvider = Provider.of<SettingProviders>(context);
    getValuesFromShared();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: settingsProvider.currentTheme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailes.routeName: (_) => SuraDetailes(),
        HadethDetailsScreen.routeName: (_) => HadethDetailsScreen()
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLan),
    );
  }

  void getValuesFromShared() async {
    final pref = await SharedPreferences.getInstance();
    // set Language from SharedPrefrences
    settingsProvider.changeLanguage(pref.getString('lang') ?? 'ar');
    // set Theme from SharedPrefrences

    if (pref.getString('theme') == 'light') {
      settingsProvider.changeTheme(ThemeMode.light);
    } else if (pref.getString('theme') == 'dark') {
      settingsProvider.changeTheme(ThemeMode.dark);
    }
  }
}
