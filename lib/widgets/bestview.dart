//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//screens
import '/screens/products/prodetails.dart';

//widgets
import '/widgets/bestsellers.dart';

class BestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    final form = Provider.of<FormProvider>(context);

    List visibleWidgets = provider.products.where(
      (widget) {
        return form.category == ''
            ? widget.best && widget.brand == form.brand
            : widget.best &&
                widget.brand == form.brand &&
                widget.category == form.category;
      },
    ).toList();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 0.565,
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
          child: BestSellers(
            item: visibleWidgets[index],
            rank: index + 1,
          ),
        );
      },
      itemCount: visibleWidgets.length,
    );
  }
}
