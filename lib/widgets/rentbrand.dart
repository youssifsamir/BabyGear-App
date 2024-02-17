//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/products.dart';

//widgets
import '/widgets/rentbrandbox.dart';

class RentBrand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (BuildContext context, int index) {
        return BrandBox(
          image: provider.Brands[index],
          name: provider.BName[index],
        );
      },
      itemCount: provider.Brands.length,
    );
  }
}
