import 'package:Clock_app/widget/alarm.dart';

import '../data.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  static const routename = '/alarmpage';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFF2D2F41),
      height: height,
      width: width,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: alarms.map<Widget>((alarm) {
                  return AlarmWidget();
                }).toList(),
              )),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(Icons.add, size: 40, color: Colors.white),
                  backgroundColor: Colors.purple[900],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
