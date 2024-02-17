//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//screens
import '/screens/products/prodgate.dart';

//widgets
import '/widgets/gridbox2.dart';

class HomeGrid2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    final update = Provider.of<FormProvider>(context);

    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 1.4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            update.reset();
            update.setCategory(provider.Name[index]);
            Navigator.pushNamed(context, ProdGate.routeName);
          },
          child: GridBox2(
            image: provider.Images[index],
            name: provider.Name[index],
          ),
        );
      },
      itemCount: provider.Images.length,
    );
  }
}
