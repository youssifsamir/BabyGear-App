//packages
import 'package:flutter/material.dart';

class OfferBox extends StatelessWidget {
  final String plan, cost;
  final bool selected;
  final int page;
  OfferBox({
    required this.plan,
    required this.cost,
    required this.selected,
    required this.page,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: selected && page == 1
              ? Colors.indigo[500]!
              : selected && page == 2
                  ? Colors.brown[400]!
                  : Colors.black,
          width: selected ? 1.5 : 0,
        ),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: selected && page == 1
                ? Colors.indigo[500]!
                : selected && page == 2
                    ? Colors.brown[400]!
                    : Colors.black,
            radius: 10,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: selected && page == 1
                    ? Colors.indigo[500]!
                    : selected && page == 2
                        ? Colors.brown[400]!
                        : Colors.white,
                radius: 6,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            plan,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans',
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 80),
          SizedBox(
            child: VerticalDivider(
              color: selected && page == 1
                  ? Colors.indigo[500]!
                  : selected && page == 2
                      ? Colors.brown[400]!
                      : Colors.white,
              thickness: 0.5,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            cost,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Open Sans',
            ),
          ),
        ],
      ),
    );
  }
}
