//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//widgets
import '/widgets/imgbox.dart';

class ImgView extends StatelessWidget {
  final Product prod;
  ImgView({required this.prod});

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);

    return GridView.builder(
      padding: const EdgeInsets.only(left: 10, right: 10),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 1.25,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ImgBX(
          index: index,
          image: prod.imgs[form.prodColour][index],
        );
      },
      itemCount: prod.imgs[form.prodColour].length,
    );
  }
}
