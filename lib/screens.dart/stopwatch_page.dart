import 'package:flutter/material.dart';

class StopWatchPage extends StatefulWidget {
  static const routename = '/stopwatchpage';
  @override
  _StopWatchPageState createState() => _StopWatchPageState();
}

class _StopWatchPageState extends State<StopWatchPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Stopwatch Screen'),
    );
  }
}
