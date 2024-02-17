//packages
import 'package:flutter/material.dart';

//widgets
import '/widgets/rentbrand.dart';
import '/widgets/rentcategories.dart';

// ignore: use_key_in_widget_constructors
class MarketProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 60),
        //productType
        Text(
          ' Select Product Type:',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontFamily: 'Open Sans',
          ),
        ),
        const SizedBox(height: 15),
        //productType
        SizedBox(
          height: 130,
          child: RentCategories(),
        ),
        const SizedBox(height: 20),
        //productBrand
        Text(
          '  Select Product Brand:',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).primaryColor,
            fontFamily: 'Open Sans',
          ),
        ),
        const SizedBox(height: 15),
        //productBrand
        SizedBox(
          height: 115,
          child: RentBrand(),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
