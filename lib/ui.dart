import 'package:betterbili/main.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './http.dart';

// Color映射表
Map<String, Color> themeColorMap = {
  'gray': Colors.grey,
  'blue': Colors.blue,
  'blueAccent': Colors.blueAccent,
  'cyan': Colors.cyan,
  'deepPurple': Colors.purpleAccent,
  'deepPurpleAccent': Colors.deepPurpleAccent,
  'deepOrange': Colors.orangeAccent,
  'green': Colors.green,
  'indigo': Colors.indigo,
  'indigoAccent': Colors.indigoAccent,
  'orange': Colors.orange,
  'purple': Colors.purple,
  'pink': Colors.pink,
  'red': Colors.red,
  'teal': Colors.teal,
};

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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("BetterBili"),
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

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var AppTheme = context.watch<appTheme>();
    List darkModeTiles = appState.darkModeTiles;
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
                title: Text("Dark Mode Setting"),
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
            }
            return null;
          },
          separatorBuilder: (BuildContext context, int index) {
            if (index != 0 && index != 4) {
              return Divider();
            } else {
              return Container();
            }
          },
          itemCount: 100,
        ));
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    var accountText = appState.accountText;
    var accountIcon = appState.accountIcon;
    return Scaffold(
        appBar: AppBar(
          title: Text("Account"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, index) {
            if (index < 1) {
              return ListTile(
                title: Text("login"),
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
                title: Text("Setting"),
                leading: Icon(Icons.settings),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
              );
            } else {
              int _index = index - 1;
              return ListTile(
                leading: accountIcon[_index],
                title: Text(accountText[_index]),
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
