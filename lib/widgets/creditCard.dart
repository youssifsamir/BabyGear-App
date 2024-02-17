//packages
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreditCardWidget extends StatelessWidget {
  String name, number, expiryDate, cvv;
  CreditCardWidget({
    super.key,
    required this.name,
    required this.number,
    required this.expiryDate,
    required this.cvv,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Colors.blue,
            Colors.green,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 25),
            const Text(
              'Card Number',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RaleWay',
              ),
            ),
            Center(
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Cairo',
                  fontSize: 23,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Expiry date',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RaleWay',
                        fontSize: 12,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      expiryDate,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      name.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Open Sans',
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Text(
                      'CVV',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RaleWay',
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cvv,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 23,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
