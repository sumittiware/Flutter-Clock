import 'package:Clock_app/info/enum.dart';
import 'package:flutter/foundation.dart';

class MenuInfo with ChangeNotifier {
  MenuType menuType;
  String title;
  String imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  void updateMenu(MenuInfo menuinfo) {
    this.menuType = menuinfo.menuType;
    this.title = menuinfo.title;
    this.imageSource = menuinfo.imageSource;

    notifyListeners();
  }
}
