//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';

//widgets
import '/widgets/colorselector.dart';
import '/widgets/conditionselector.dart';

// ignore: use_key_in_widget_constructors
class MarketDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    return Container(
      height: 460,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 35),
          //productName
          Padding(
            padding: const EdgeInsets.only(left: 1.25),
            child: Text(
              'Product Name:',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                fontFamily: 'Open Sans',
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 350,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
            child: TextField(
              onChanged: (value) => form.setName(value),
              maxLines: 1,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                hintText: form.name,
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 10, bottom: 15),
              ),
            ),
          ),
          const SizedBox(height: 38),

          //productColor
          SizedBox(
            height: 50,
            width: 350,
            child: Row(
              children: <Widget>[
                Text(
                  ' Product Color:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Open Sans',
                  ),
                ),
                const SizedBox(width: 80),
                ColorSelector(),
              ],
            ),
          ),

          //productCondition
          SizedBox(
            height: 50,
            width: 350,
            child: Row(
              children: <Widget>[
                Text(
                  ' Product Condition:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Open Sans',
                  ),
                ),
                const SizedBox(width: 43),
                ConditionSelector(),
              ],
            ),
          ),
          const SizedBox(height: 40),

          //productDescription
          Text(
            ' Product Description:',
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryColor,
              fontFamily: 'Open Sans',
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 3),
            padding: const EdgeInsets.only(left: 10),
            width: 350,
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
            child: Scrollbar(
              child: TextField(
                onChanged: (value) => form.setDescription(value),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                maxLines: 4,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: form.description,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
