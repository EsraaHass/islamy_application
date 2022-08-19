import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/home/commonWidget/bodyOfSettings.dart';
import 'package:islamy_app/home/providers/settingsProvider.dart';
import 'package:islamy_app/home/settings/languageBottomSheet.dart';
import 'package:islamy_app/home/settings/themeBottomSheet.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var settingProvders = Provider.of<SettingProviders>(context);

    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 6,
            ),
            InkWell(
                onTap: () {
                  showLanguageBottomSheet();
                },
                child: BodyOfSettings(
                  'English',
                  Theme.of(context).backgroundColor,
                  text: Theme.of(context).textTheme.headline5,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 13,
            ),
            InkWell(
                onTap: () {
                  showThemeBottomSheet();
                },
                child: BodyOfSettings(
                  settingProvders.isDarkMode()
                      ? AppLocalizations.of(context)!.dark
                      : AppLocalizations.of(context)!.light,
                  Theme.of(context).backgroundColor,
                  text: Theme.of(context).textTheme.headline5,
                )),
          ],
        ));
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return LanguageBottomSheet();
        });
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ThemeBottomSheet();
        });
  }
}
