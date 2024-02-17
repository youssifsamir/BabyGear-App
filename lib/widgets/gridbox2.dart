//packages
import 'package:flutter/material.dart';

class GridBox2 extends StatelessWidget {
  final String image, name;
  GridBox2({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color.fromARGB(7, 0, 0, 0),
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              image,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(
          name,
          style: const TextStyle(
            color: Color.fromARGB(180, 0, 0, 0),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
