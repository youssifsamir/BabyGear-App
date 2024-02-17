//packages
import 'package:flutter/material.dart';

//widgets
import '/widgets/tipslist.dart';
import '/widgets/tipsfilter.dart';

// ignore: use_key_in_widget_constructors
class TipsScreen extends StatelessWidget {
  static const routeName = './tips.dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 15),
          SizedBox(
            width: 360,
            height: 38,
            child: TipsFilter(),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Colors.black12,
          ),
          const SizedBox(height: 15),
          const SizedBox(
            height: 585,
            child: TipsList(),
          )
        ],
      ),
    );
  }
}
