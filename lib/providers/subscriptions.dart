//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Subscription {
  final String text, img;
  final IconData icon;
  final Color color;

  Subscription({
    required this.text,
    required this.icon,
    required this.img,
    required this.color,
  });
}

class SubscriptionProvider with ChangeNotifier {
  int selected = 0, type = 0, page = 0;

  final List<Subscription> _subs = [
    Subscription(
      text: 'Earn upto 50% on your favorite products!',
      icon: Icons.discount_outlined,
      img: './assets/images/discounts.jpeg',
      color: Colors.amber,
    ),
    Subscription(
      text: 'Unlock unlimited tips  & advices!',
      icon: Icons.spa_outlined,
      img: './assets/images/spa.png',
      color: Colors.green[200]!,
    ),
    Subscription(
      text: 'Recieve monhtly boxes full of love!',
      icon: FontAwesomeIcons.heart,
      img: './assets/images/hearts.png',
      color: Colors.red[200]!,
    ),
  ];

  final List<String> _plans = [
    '1 Months Plan',
    '3 Months Plan',
    '6 Months Plan',
    '1 Year  Plan    ',
  ];

  final List<String> _cost = [
    'EGP 600',
    'EGP 1500',
    'EGP 2700',
    'EGP 4800',
  ];

  final List<String> _costB = [
    'EGP 600',
    'EGP 1500',
    'EGP 2400',
  ];

  final List<String> _costD = [
    'EGP 650',
    'EGP 1650',
    'EGP 2700',
  ];

  final List<String> _package = [
    'Belly Bundle',
    'Labor of Love',
    'Basic',
    'Deluxe',
  ];

  List<String> get plans {
    return [..._plans];
  }

  List<String> get cost {
    return [..._cost];
  }

  List<String> get costD {
    return [..._costD];
  }

  List<String> get costB {
    return [..._costB];
  }

  List<Subscription> get subs {
    return [..._subs];
  }

  void setSelected(int n) {
    selected = n;
    notifyListeners();
  }

  int getSelected() {
    return selected;
  }

  void setType(int n) {
    type = n;
    notifyListeners();
  }

  int getType() {
    return type;
  }

  void setPage(int n) {
    page = n;
    notifyListeners();
  }

  String getPackage() {
    if (page == 1)
      return _package[type];
    else
      return _package[type + 2];
  }

  String getPrices() {
    if (page == 1)
      return cost[selected];
    else {
      if (type == 1)
        return costD[selected];
      else
        return costB[selected];
    }
  }

  int getPage() {
    return page;
  }
}
