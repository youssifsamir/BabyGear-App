//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';

//widgets
import '/widgets/rentbrand.dart';
import '/widgets/imageuploader.dart';
import '/widgets/colorselector.dart';
import '/widgets/rentcategories.dart';
import '/widgets/conditionselector.dart';

// ignore: use_key_in_widget_constructors
class MarketScreen extends StatefulWidget {
  static const routeName = './market.dart';

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);

    return ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //upperMessage
              const Text(
                "Got a product you're no longer using? Offer it for rent and earn money now!",
                style: TextStyle(
                  // color: Theme.of(context).primaryColor,
                  color: Color.fromARGB(71, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 20),
              //productName
              Text(
                'Product Name:',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(height: 10),
              //productName
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  color: Color.fromARGB(7, 0, 0, 0),
                ),
                height: 30,
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10, bottom: 18),
                  ),
                ),
              ),
              const SizedBox(height: 30),

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
                ' Select Product Brand:',
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
              //productColor
              SizedBox(
                height: 50,
                width: 350,
                child: Row(
                  children: <Widget>[
                    Text(
                      ' Product Color:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 60),
                    Container(
                      decoration: BoxDecoration(
                        color: form.color,
                        border: Border.all(
                          color: Colors.black38,
                          width: 0,
                        ),
                        // color: Colors.black12,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      width: 140,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 120,
                            child: ColorSelector(),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Colors.black38,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
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
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black38,
                          width: 0,
                        ),
                        // color: Colors.black12,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                      width: 140,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            width: 120,
                            child: ConditionSelector(),
                          ),
                          const Icon(
                            Icons.arrow_drop_down_outlined,
                            // color: Theme.of(context).primaryColor,
                            color: Colors.black38,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //productDescription
              Text(
                ' Product Description:',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 4),
                padding: const EdgeInsets.only(left: 10),
                width: 350,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: Scrollbar(
                  child: TextField(
                    maxLines: 4,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),

              ImageUploader(),
              //agree on terms & conditions
            ],
          ),
        ),
      ],
    );
  }
}
