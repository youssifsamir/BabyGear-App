//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:dots_indicator/dots_indicator.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';
import '/providers/billboard.dart';

//screens
import '/screens/products/prodetails.dart';

//widgets
import '/widgets/homegrid.dart';
import '/widgets/billboard.dart';
import '/widgets/searchbar.dart';
import '/widgets/categories.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatefulWidget {
  static const routeName = "./home.dart";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    final products = Provider.of<ProductsProvider>(context);
    final provider = Provider.of<BillboardProvider>(context);
    // ignore: unused_local_variable
    String searchValue = '';
    List<String> productsNames = [];
    // ignore: no_leading_underscores_for_local_identifiers
    final ScrollController _controller = ScrollController();

    // ignore: no_leading_underscores_for_local_identifiers
    void _scrollDown() {
      _controller.animateTo(
        _controller.position.extentInside,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubicEmphasized,
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                width: 340,
                height: 40,
                child: StatefulBuilder(
                  builder: (context, setState) => EasySearchBar(
                    elevation: 0,
                    title: const Text(''),
                    onSuggestionTap: (productName) {
                      Navigator.pushNamed(
                        context,
                        ProdDetails.routeName,
                        arguments: products.products.firstWhere(
                            (element) => element.name == productName),
                      );
                    },
                    suggestions: productsNames,
                    backgroundColor: const Color.fromARGB(5, 0, 0, 0),
                    iconTheme: const IconThemeData(color: Colors.black38),
                    onSearch: (value) => setState(
                      () {
                        searchValue = value;
                        value == ''
                            ? productsNames = []
                            : productsNames = products.productsNames();
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(right: 130),
              child: Text(
                'Gears & Equipments',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Freehand',
                  fontSize: 22.5,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 350,
              height: 215,
              child: Categories(),
            ),
            const SizedBox(height: 5),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: SizedBox(
                height: 100,
                width: 342,
                child: Billboard(),
              ),
            ),
            const SizedBox(height: 10),
            DotsIndicator(
              dotsCount: provider.Images.length,
              position: provider.currentImg.toDouble(),
              decorator: const DotsDecorator(
                size: Size(7, 7),
                activeSize: Size(7, 7),
                color: Colors.black12,
                activeColor: Colors.black38,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 24),
                  Text(
                    'Featured Brands',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Freehand',
                      fontSize: 22.5,
                    ),
                  ),
                  SizedBox(width: form.brandView ? 113 : 120),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: GestureDetector(
                      onTap: () {
                        !form.brandView ? _scrollDown() : null;
                        form.setBrandView(!form.brandView);
                      },
                      child: Text(
                        form.brandView ? 'View Less' : 'View All',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Open Sans',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 1.5),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {
                        !form.brandView ? _scrollDown() : null;
                        form.setBrandView(!form.brandView);
                      },
                      child: Icon(
                        form.brandView
                            ? Icons.keyboard_arrow_up_rounded
                            : Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  left: 8,
                ),
                width: 360,
                height: form.brandView ? 550 : 120,
                child: HomeGrid(),
              ),
            ),
            const SizedBox(height: 12.5),
            // Padding(
            //   padding: const EdgeInsets.only(right: 210),
            //   child: Text(
            //     'Our Services',
            //     style: TextStyle(
            //       color: Theme.of(context).primaryColor,
            //       fontFamily: 'Freehand',
            //       fontSize: 22.5,
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 25),
            // AboutUsSnippet(),
          ],
        ),
      ),
    );
  }
}
