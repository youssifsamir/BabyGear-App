//packages
import 'package:flutter/material.dart';

class TipsTile extends StatelessWidget {
  final String title, image, text;
  final bool vis;
  final Icon icon;
  const TipsTile({
    super.key,
    required this.title,
    required this.image,
    required this.text,
    required this.vis,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.asset(
                    image,
                    height: 175,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Visibility(
                  visible: vis,
                  child: Positioned(
                    top: 20,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 2,
                        bottom: 7.5,
                        left: 20,
                        right: 20,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: Colors.black87,
                      ),
                      height: 25,
                      width: 120,
                      child: Image.asset(
                        './assets/images/prem.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      width: 220,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 52, 48, 47),
                                fontFamily: 'Open Sans',
                                fontSize: 16.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        text,
                        style: const TextStyle(
                          color: Colors.brown,
                          fontFamily: 'Open Sans',
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: icon,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
