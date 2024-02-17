//packages
import 'package:flutter/material.dart';

class StepsBox extends StatelessWidget {
  final String title, image, text;
  final bool left;
  StepsBox({
    required this.title,
    required this.image,
    required this.text,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return left
        ? Row(
            children: <Widget>[
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'ios',
                      fontSize: 19,
                      color: Color.fromARGB(145, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  SizedBox(
                    width: 225,
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontFamily: 'iosReg',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 100,
                child: Image.asset(
                  image,
                ),
              ),
            ],
          )
        : Row(
            children: <Widget>[
              const SizedBox(width: 20),
              SizedBox(
                width: 100,
                child: Image.asset(
                  image,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'ios',
                      fontSize: 19,
                      color: Color.fromARGB(145, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  SizedBox(
                    width: 225,
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontFamily: 'iosReg',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}
