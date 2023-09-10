import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../lists.dart';
import 'mainPages.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List languageValue=["zh","en"];
  String languageGroupValue = SpUtil.getString("Language", defValue: "zh")!;
  List _languageTileLists = ["简体中文", "English"];

  void _changedLanguage(value) {
    if (value != null) {
      SpUtil.putString("Language", value);
      setState(() {
        languageGroupValue = value;
        if (value == "zh") S.load(Locale('zh', 'CN'));
        if (value == "en") S.load(Locale('en', 'US'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var AppTheme = context.watch<appTheme>();
    List darkModeTiles = [S.of(context).DarkModeLight, S.of(context).DarkModeDark, S.of(context).DarkModeAuto];
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            if (index == 0) {
              return ListTile(
                title: Text(S.of(context).DarkModeTitle),
                leading: Icon(Icons.shield_moon),
              );
            } else if (index > 0 && index <= 3) {
              return RadioListTile(
                  value: index - 1,
                  groupValue: AppTheme.darkMode,
                  onChanged: (e) {
                    AppTheme.changeDarkMode(e!);
                  },
                  title: Text(darkModeTiles[index - 1]));
            } else if (index == 4) {
              return ListTile(
                title: Text("Theme Setting"),
              );
            } else if (index == 5) {
              return ListTile(
                title: Text(S.of(context).LanguageTitle),
                leading: Icon(Icons.language),
              );
            } else if (index > 5 && index <= 7) {
              return RadioListTile(
                  value: languageValue[index-6],
                  groupValue: languageGroupValue,
                  onChanged: (e) {
                    _changedLanguage(e);
                  },
                  title: Text(_languageTileLists[index - 6]));
            }
            return null;
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index != 0 && index != 5) {
              return Divider();
            } else {
              return Container();
            }
          },
          itemCount: 100,
        ));
  }
}
