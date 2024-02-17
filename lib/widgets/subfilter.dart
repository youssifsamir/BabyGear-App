//packages
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/subscriptions.dart';

class SubFilter extends StatefulWidget {
  @override
  State<SubFilter> createState() => _SubFilterState();
}

class _SubFilterState extends State<SubFilter> {
  double x = 0;
  bool drag = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: provider.getPage() == 1 ? Colors.indigo[400] : Colors.brown[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      width: 300,
      height: 40,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTapDown: (details) => setState(
              () {
                drag = false;
                details.globalPosition.dx > 135 ? x = 135 : x = 0;
                provider.setType(x == 135 ? 1 : 0);
              },
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 7.5),
              child: Row(
                children: <Widget>[
                  SizedBox(width: provider.getPage() == 1 ? 22.5 : 50),
                  Text(
                    provider.getPage() == 1 ? 'Belly Bundle' : 'Basic',
                    style: TextStyle(
                      color: x == 0
                          ? Colors.white
                          : x == 135
                              ? Colors.black38
                              : Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: provider.getPage() == 1 ? 55 : 110),
                  Text(
                    provider.getPage() == 1 ? 'Labor of Love' : 'Deluxe',
                    style: TextStyle(
                      color: x == 135
                          ? Colors.white
                          : x == 0
                              ? Colors.black38
                              : Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            left: x,
            curve: Curves.easeInOutCubicEmphasized,
            duration: Duration(milliseconds: drag ? 0 : 500),
            width: 165,
            height: 40,
            child: Opacity(
              opacity: 0.5,
              child: GestureDetector(
                onPanEnd: (details) => setState(() {
                  x > 67.5 ? x = 135 : x = 0;
                  provider.setType(x == 135 ? 1 : 0);
                }),
                onPanUpdate: (details) => setState(
                  () {
                    drag = true;
                    x = max(
                      0,
                      (x + details.delta.dx) > 135 ? 135 : x + details.delta.dx,
                    );
                    provider.setType(x == 135 ? 1 : 0);
                  },
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
