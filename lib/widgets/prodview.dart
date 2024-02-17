//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//screens
import '/screens/products/prodetails.dart';

//widgets
import '/widgets/productbox.dart';

class ProdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    final form = Provider.of<FormProvider>(context);

    List visibleWidgets =
        provider.getProducts(form.brand, form.category, form.type);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.725,
        crossAxisSpacing: 35,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            form.img = 0;
            Navigator.pushNamed(
              context,
              ProdDetails.routeName,
              arguments: visibleWidgets[index],
            );
          },
          child: ProductBox(
            prod: visibleWidgets[index],
          ),
        );
      },
      itemCount: visibleWidgets.length,
    );
  }
}
