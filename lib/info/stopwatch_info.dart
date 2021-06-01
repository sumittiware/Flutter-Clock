import 'package:flutter/foundation.dart';

class StopWatchInfo {
  bool start = false;
  bool stop = false;
  bool paused = false;

  StopWatchInfo();
}

class StopWatchItem with ChangeNotifier {
  StopWatchInfo item = StopWatchInfo();

  void start() {
    item.start = true;
    notifyListeners();
  }

  void stop() {
    item.stop = true;
    notifyListeners();
  }

  void pause() {
    item.paused = true;
    notifyListeners();
  }

  void resume() {
    item.paused = !item.paused;
    notifyListeners();
  }
}
