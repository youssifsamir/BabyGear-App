//packages
import 'package:flutter/material.dart';

class SubPack extends StatelessWidget {
  final String title, txt, img;
  final bool left;
  final Color boxColour, subColour, titleColour, buttonColour, dividerColour;
  const SubPack({
    super.key,
    required this.title,
    required this.txt,
    required this.img,
    required this.boxColour,
    required this.titleColour,
    required this.subColour,
    required this.buttonColour,
    required this.dividerColour,
    required this.left,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: boxColour,
      ),
      width: 370,
      height: 150,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              img,
              height: 150,
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 150,
            width: 180,
            padding: const EdgeInsets.only(left: 15, top: 12),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: titleColour,
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 150,
                  height: 0,
                  child: Divider(
                    thickness: 0.45,
                    color: dividerColour,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  txt,
                  style: TextStyle(
                    color: subColour,
                    fontFamily: 'Open Sans',
                    fontSize: 10.85,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    color: buttonColour,
                  ),
                  width: 155,
                  height: 30,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Explore Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2.5, left: 3),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 10,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
