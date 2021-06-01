import 'dart:async';

import 'package:Clock_app/screens.dart/alarm_page.dart';
import 'package:Clock_app/screens.dart/clock_page.dart';
import 'package:Clock_app/clock/colck_view.dart';
import 'package:Clock_app/info/enum.dart';
import 'package:Clock_app/info/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import './stopwatch_page.dart';

import '../data.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuItem) => buildFlatButton(currentMenuItem))
                  .toList()),
          VerticalDivider(
            color: Colors.white54,
          ),
          Expanded(
            child: Consumer<MenuInfo>(builder: (context, value, child) {
              if (value.menuType == MenuType.clock) {
                return ClockPage();
              } else if (value.menuType == MenuType.alarm) {
                return AlarmPage();
              } else if (value.menuType == MenuType.stopwatch) {
                return Container(); //StopWatch();
              } else {
                return Center(
                    child: Text(
                  'Under Constructor',
                  style: TextStyle(color: Colors.white),
                ));
              }
            }),
          ),
        ],
      ),
    );
  }

  Widget buildFlatButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), bottomLeft: Radius.circular(32)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
          color: (currentMenuInfo.menuType == value.menuType)
              ? Color(0xFF444974)
              : Colors.transparent,
          onPressed: () {
            var menuinfo = Provider.of<MenuInfo>(context, listen: false);
            menuinfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              Text(
                currentMenuInfo.title,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        );
      },
    );
  }
}
