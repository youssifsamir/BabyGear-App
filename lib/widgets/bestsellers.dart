//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:ribbon_widget/ribbon_widget.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

//providers
import '/providers/products.dart';

class BestSellers extends StatelessWidget {
  final Product item;
  final int rank;
  const BestSellers({super.key, required this.item, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 10),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            blurRadius: 4,
            offset: Offset(0, 5),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(13.5),
        ),
      ),
      child: Ribbon(
        nearLength: 30,
        farLength: 0,
        title: '$rank',
        titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        color: const Color.fromARGB(145, 28, 145, 141),
        location: RibbonLocation.topStart,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 5),
            SizedBox(
              height: 100,
              child: Image.asset(
                item.imgs[0][0],
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 9),
            SizedBox(
              width: 123,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 15),
                  FittedBox(
                    child: Text(
                      item.name,
                      style: const TextStyle(
                        color: Color.fromARGB(190, 0, 0, 0),
                        fontSize: 14.5,
                        fontFamily: 'ios',
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.5,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Starting from\nEGP ${item.price}',
                    style: TextStyle(
                      wordSpacing: 2,
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 8),
                  SmoothStarRating(
                    rating: item.rating,
                    size: 20,
                    color: Colors.amber,
                    borderColor: Colors.amber,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
