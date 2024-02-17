//packages
import 'package:flutter/material.dart';

class BillboardProvider with ChangeNotifier {
  int currentImg = 0;
  final _images = [
    './assets/images/ad1.webp',
    './assets/images/ad3.jpeg',
    './assets/images/ad5.jpeg',
  ];

  // ignore: non_constant_identifier_names
  List<String> get Images {
    return [..._images];
  }

  void setIndex(int n) {
    currentImg = n;
    notifyListeners();
  }
}
