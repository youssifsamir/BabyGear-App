//packages
import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final String image, name;
  GridBox({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 0.25,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          padding: const EdgeInsets.all(10),
          height: 80,
          width: 80,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 5),
        FittedBox(
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 12,
              color: Color.fromARGB(180, 0, 0, 0),
            ),
          ),
        ),
      ],
    );
  }
}
