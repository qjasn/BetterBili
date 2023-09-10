import 'package:betterbili/pages/settingPage.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import './loginPages.dart';
import '../lists.dart';

class appTheme with ChangeNotifier {
  String appThemeColor = SpUtil.getString("appThemeColor", defValue: "blue")!;
  int darkMode = SpUtil.getInt("appDarkMode", defValue: 2)!;

  // String appThemeColor = 'deepOrange';
  // 改变主题样式
  changeTheme(String themeColor) {
    appThemeColor = themeColor;
    notifyListeners();
  }

  changeDarkMode(int darkMode) {
    SpUtil.putInt("appDarkMode", darkMode);
    this.darkMode = darkMode;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(S.of(context).HomeTitle),
            ),
            body: Column(
              children: [
                Text("Home"),
                ElevatedButton(
                  onPressed: () {
                    SpUtil.putString("appThemeColor", "red");
                    Provider.of<appTheme>(context, listen: false)
                        .changeTheme("red");
                  },
                  child: Text("Change Theme"),
                )
              ],
            )));
  }
}

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {

    List accountText = ["Place", S.of(context).HistoryTitle, S.of(context).StarsTitle, S.of(context).DownloadTitle];
    List accountIcon = [
      Icon(Icons.place),
      Icon(Icons.history),
      Icon(Icons.star_border),
      Icon(Icons.download)
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).AccountTitle),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            if (index < 1) {
              return ListTile(
                title: Text(S.of(context).LoginTitle),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const Login(
                            method: "qrcode",
                          )));
                },
              );
            } else if (index == 5) {
              return ListTile(
                title: Text(S.of(context).SettingTitle),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
              );
            } else {
              index = index - 1;
              return ListTile(
                leading: accountIcon[index],
                title: Text(accountText[index]),
              );
            }
          },
          separatorBuilder: (BuildContext context, index) {
            return Divider();
          },
          itemCount: 6,
        ));
  }
}
