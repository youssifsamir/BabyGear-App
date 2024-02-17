//packages
import 'package:flutter/material.dart';

//providers
import '/providers/products.dart';

//widgets
import '/widgets/colourbox.dart';

class ColourView extends StatelessWidget {
  final Product prod;
  const ColourView({super.key, required this.prod});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 2.5,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ColourBX(
          index: index,
          colour: prod.colors[index],
        );
      },
      itemCount: prod.colors.length,
    );
  }
}
