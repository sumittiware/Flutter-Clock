import './info/menu_info.dart';
import './info/alarm_info.dart';
import 'info/enum.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png'),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now(), 'Wake Up', true),
  AlarmInfo(DateTime.now(), 'Wake Up', true),
  AlarmInfo(DateTime.now(), 'Wake Up', true),
  AlarmInfo(DateTime.now(), 'Wake Up', true),
];
