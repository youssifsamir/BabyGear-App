//packages
import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  String name = '',
      category = '',
      brand = '',
      condition = '',
      description = '',
      image = '',
      type = 'All';
  int index = 6, index2 = 2, subScreen = 0, prodColour = 0, img = 0;
  late Color color = Colors.white;
  bool brandView = false;

  final List<String> _titles = [
    'Product Category & Brand',
    'Product Name & Description',
    'Product Image',
  ];

  List<String> get title {
    return [..._titles];
  }

  void setBrandView(bool view) {
    brandView = view;
    notifyListeners();
  }

  void setScreen(int s) {
    subScreen = s;
    notifyListeners();
  }

  void setIndex(int x) {
    index = x;
    notifyListeners();
  }

  void setIndex2(int x) {
    index2 = x;
    notifyListeners();
  }

  void setName(String n) {
    name = n;
    notifyListeners();
  }

  void setCategory(String t) {
    category = t;
    notifyListeners();
  }

  void setBrand(String b) {
    brand = b;
    notifyListeners();
  }

  void setColor(Color c) {
    color = c;
    notifyListeners();
  }

  void setProdColour(int n) {
    prodColour = n;
    notifyListeners();
  }

  void setCondition(String con) {
    condition = con;
    notifyListeners();
  }

  void setDescription(String d) {
    description = d;
    notifyListeners();
  }

  void setImage(String img) {
    image = img;
    notifyListeners();
  }

  void setType(String t) {
    type = t;
    notifyListeners();
  }

  void setImg(int n) {
    img = n;
    notifyListeners();
  }

  String getType() {
    return type;
  }

  bool allow() {
    if (subScreen == 0 && brand.isNotEmpty && category.isNotEmpty) {
      return true;
    } else if (subScreen == 1 &&
        color != Colors.transparent &&
        name.trim().isNotEmpty &&
        description.trim().isNotEmpty &&
        condition.trim().isNotEmpty) {
      return true;
    } else if (subScreen == 2 && image != '') {
      return true;
    }
    return false;
  }

  void reset() {
    index = 6;
    index2 = 2;
    subScreen = 0;
    name = '';
    category = '';
    brand = '';
    type = 'All';
    condition = '';
    description = '';
    image = '';
    color = Colors.white;
  }
}
