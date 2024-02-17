//packages
import 'package:flutter/material.dart';

//providers
import '/providers/subscriptions.dart';

class SubAdBox extends StatelessWidget {
  final Subscription subscription;
  const SubAdBox({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.asset(
                subscription.img,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: subscription.color,
                ),
                child: Icon(
                  subscription.icon,
                  color: const Color.fromARGB(200, 0, 0, 0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 40, right: 10),
                child: Text(
                  subscription.text,
                  style: const TextStyle(
                    color: Color.fromARGB(200, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
