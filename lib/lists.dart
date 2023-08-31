import 'package:flutter/material.dart';
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
// BiliApi Map
Map<String, String> bilibiliApiMap = {
  'login_qrcode_generate':
  "https://passport.bilibili.com/x/passport-login/web/qrcode/generate",
  'login_qrcode_poll':
  'https://passport.bilibili.com/x/passport-login/web/qrcode/poll',
  'member_account': 'https://api.bilibili.com/x/member/web/account',
  'logout': 'https://passport.bilibili.com/login/exit/v2',
};

class AppState extends ChangeNotifier {
  // 存放各种listView的内容
  List darkModeTiles = ["Light", "Dark", "Auto"];
  List accountText = ["Place", "History", "Star", "Download"];
  List accountIcon = [
    Icon(Icons.place),
    Icon(Icons.history),
    Icon(Icons.star_border),
    Icon(Icons.download)
  ];
}
