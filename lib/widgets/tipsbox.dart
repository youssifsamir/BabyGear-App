//packages
import 'package:flutter/material.dart';

class TipsBox extends StatelessWidget {
  final String type;
  final double selected;
  final Color colour;
  final Color txtcolour;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TipsBox({
    required this.type,
    required this.selected,
    required this.colour,
    required this.txtcolour,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              width: 0,
              color: Colors.black26,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                type,
                style: TextStyle(
                  color: txtcolour,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        AnimatedContainer(
          margin: const EdgeInsets.only(top: 5),
          width: selected,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            color: colour,
          ),
          curve: Curves.easeInOutCubicEmphasized,
          duration: const Duration(milliseconds: 1000),
        ),
      ],
    );
  }
}
