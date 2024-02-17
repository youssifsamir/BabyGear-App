//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/products.dart';

//widgets
import '/widgets/categorybox.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 1.275,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryBox(
          image: provider.RImages[index],
          type: provider.RName[index],
        );
      },
      itemCount: provider.RImages.length,
    );
  }
}
