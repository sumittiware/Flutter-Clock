import 'package:Clock_app/info/enum.dart';
import 'package:Clock_app/info/menu_info.dart';
import 'package:Clock_app/info/stopwatch_info.dart';
import 'package:Clock_app/screens.dart/alarm_page.dart';
import 'package:Clock_app/screens.dart/clock_page.dart';
import 'package:Clock_app/screens.dart/stopwatch_page.dart';
import 'package:Clock_app/screens.dart/tabsscreen.dart';
import 'package:Clock_app/screens.dart/timerscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens.dart/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Quicksand'),
      home: MultiProvider(providers: [
        Provider<MenuInfo>(create: (_) => MenuInfo(MenuType.clock)),
        Provider<StopWatchInfo>(
          create: (_) => StopWatchInfo(),
        )
      ], child: TabsScreen()),
      routes: {
        ClockPage.routename: (ctx) => ClockPage(),
        AlarmPage.routename: (ctx) => AlarmPage(),
        StopWatchPage.routename: (ctx) => StopWatchPage(),
        TimerScreen.routename: (ctx) => TimerScreen()
      },
    );
  }
}
