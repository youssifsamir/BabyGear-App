//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//screens
import '/screens/products/prodgate.dart';

//widgets
import '/widgets/gridbox.dart';

class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final update = Provider.of<FormProvider>(context);
    final provider = Provider.of<ProductsProvider>(context);

    return GridView.builder(
      physics: update.brandView ? const NeverScrollableScrollPhysics() : null,
      scrollDirection: update.brandView ? Axis.vertical : Axis.horizontal,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: update.brandView ? 100 : 150,
        childAspectRatio: update.brandView ? 0.7 : 1.35,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            update.reset();
            update.setBrand(provider.BName[index]);
            Navigator.pushNamed(context, ProdGate.routeName);
          },
          child: GridBox(
            image: provider.Brands[index],
            name: provider.BName[index],
          ),
        );
      },
      itemCount: provider.Brands.length,
    );
  }
}
