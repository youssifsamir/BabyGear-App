//packages
import 'package:flutter/material.dart';

class BottomAppBarProvider with ChangeNotifier {
  int index = 0;

  int get getCurrentIndex {
    return index;
  }

  void resetIndex() {
    index = 0;
  }

  void updateBody(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
