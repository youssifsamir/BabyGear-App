//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';

//providers
import '/providers/billboard.dart';

// ignore: use_key_in_widget_constructors
class Billboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BillboardProvider>(context, listen: false);

    return CarouselSlider(
      items: provider.Images.map(
        (page) {
          return SizedBox(
            width: double.infinity,
            child: Image.asset(
              page,
              fit: BoxFit.cover,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        onPageChanged: (index, reason) => provider.setIndex(index),
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlay: true,
        height: double.infinity,
        viewportFraction: 1,
        enableInfiniteScroll: true,
      ),
    );
  }
}
