//packages
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class NoBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20),
          width: 180,
          child: Image.asset(
            './assets/images/login.gif',
            fit: BoxFit.cover,
          ),
        ),
        const Text(
          '               You have no babies registered.\nWhat are you waiting for? Add your babies now!',
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
            fontFamily: 'Open Sans',
          ),
        ),
      ],
    );
  }
}
