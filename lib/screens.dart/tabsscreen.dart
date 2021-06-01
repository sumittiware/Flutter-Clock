import 'package:Clock_app/screens.dart/alarm_page.dart';
import 'package:Clock_app/screens.dart/clock_page.dart';
import 'package:Clock_app/screens.dart/homepage.dart';
import 'package:Clock_app/screens.dart/stopwatch_page.dart';
import 'package:Clock_app/screens.dart/timerscreen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [];
    // TODO: implement initState
    super.initState();
  }

  int _selectedindex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Clock',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF2D2F41),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Image.asset(
                  'assets/clock_icon.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
                //text: 'clock',
              ),
              Tab(
                child: Image.asset(
                  'assets/alarm_icon.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
                //text: 'alarm',
              ),
              Tab(
                child: Image.asset(
                  'assets/stopwatch_icon.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
                //text: 'stopwatch',
              ),
              Tab(
                child: Image.asset(
                  'assets/timer_icon.png',
                  fit: BoxFit.cover,
                  height: 30,
                ),
                //text: 'timer',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ClockPage(),
          AlarmPage(),
          StopWatchPage(),
          TimerScreen()
        ]),
      ),
    );
  }
}
