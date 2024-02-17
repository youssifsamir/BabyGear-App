//packages
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AboutUsSnippet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: Colors.teal[50],
          radius: 50,
        ),
        CircleAvatar(
          backgroundColor: Colors.teal[50],
          radius: 50,
        ),
        CircleAvatar(
          backgroundColor: Colors.teal[50],
          radius: 50,
        ),
      ],
    );
  }
}
