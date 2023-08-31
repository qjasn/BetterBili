import 'package:betterbili/pages/loginPages.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/mainPages.dart';
import './lists.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化SpUtil
  await SpUtil.getInstance();
  // 加载初始页面
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        // Providers 记录App State
        providers: [
          ChangeNotifierProvider(create: (context) => AppState()),
          ChangeNotifierProvider(create: (context) => apiRequest()),
          ChangeNotifierProvider.value(value: appTheme()),
          // ChangeNotifierProvider.value(value: appDarkMode());
        ],
        child: Consumer<appTheme>(builder: (context, theme, child) {
          String themeColor = theme.appThemeColor;
          // theme.darkMode有三个值 0，1，2，详见具体的State（ui.dart中）
          child:
          return theme.darkMode == 2
              ? MaterialApp(
                  title: 'Better Bili',
                  theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: themeColorMap[themeColor]!,
                        brightness: Brightness.light),
                  ),
                  darkTheme: ThemeData(
                    useMaterial3: true,
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: themeColorMap[themeColor]!,
                        brightness: Brightness.dark),
                  ),
                  home: RootPage(),
                )
              : MaterialApp(
                  title: 'Better Bili',
                  theme: ThemeData(
                    useMaterial3: true,
                    colorScheme: ColorScheme.fromSeed(
                        seedColor: themeColorMap[themeColor]!,
                        brightness: theme.darkMode == 1
                            ? Brightness.dark
                            : Brightness.light),
                  ),
                  home: RootPage(),
                );
        }));
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  var _pageIndex = 0;
  int _firstRun = 0;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scaffold(
          // 多平台适应，当小于等于700px的时候使用底部导航栏，大于700px的时候使用侧边导航栏
          bottomNavigationBar: constraints.maxWidth <= 700
              ? BottomNavigationBar(
                  currentIndex: _pageIndex,
                  onTap: (var page) {
                    setState(() {
                      _pageIndex = page;
                    });
                    _controller.jumpToPage(page);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle), label: "Account")
                  ],
                )
              : null,
          body: Row(
            children: [
              SafeArea(
                  child: Row(children: [
                if (constraints.maxWidth > 700)
                  NavigationRail(
                    extended: constraints.maxWidth >= 800,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.account_circle),
                        label: Text("Account"),
                      )
                    ],
                    selectedIndex: _pageIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        _pageIndex = value;
                      });
                      _controller.jumpToPage(value);
                    },
                  )
              ])),
              Expanded(
                child: PageView(
                  controller: _controller,
                  // 使用两个页面，在ui.dart中
                  children: const [HomePage(), AccountPage()],
                ),
              )
            ],
          ));
    });
  }
}
