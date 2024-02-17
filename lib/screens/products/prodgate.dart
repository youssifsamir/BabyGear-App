//package
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

//screens
import 'prodetails.dart';

//widgets
import '/widgets/badge.dart';
import '/widgets/prodview.dart';
import '/widgets/bestview.dart';
import '/widgets/catglist.dart';
import '/widgets/searchbar.dart';
import '/widgets/typepopup.dart';
import '/widgets/brandgrid.dart';

// ignore: use_key_in_widget_constructors
class ProdGate extends StatefulWidget {
  static const routeName = './prodgate.dart';

  @override
  State<ProdGate> createState() => _ProdGateState();
}

class _ProdGateState extends State<ProdGate> {
  String searchValue = '';
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    final provider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            surfaceTintColor: Colors.white,
            floating: true,
            elevation: 5,
            forceElevated: true,
            toolbarHeight: 400,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            centerTitle: true,
            title: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 125),
                    Text(
                      'tetina',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 28,
                        fontFamily: 'Freehand',
                      ),
                    ),
                    const SizedBox(width: 98),
                    Badges(
                      color: const Color.fromRGBO(235, 190, 170, 1),
                      value: provider.cart.length,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.shopping_bag_outlined,
                            color: Theme.of(context).primaryColor,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //searchTab
                Row(
                  children: <Widget>[
                    const SizedBox(width: 8),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                        width: 298,
                        height: 40,
                        child: StatefulBuilder(
                          builder: (context, ss) => EasySearchBar(
                            elevation: 0,
                            title: const Text(''),
                            onSuggestionTap: (productName) {
                              Navigator.pushNamed(
                                context,
                                ProdDetails.routeName,
                                arguments: provider.products.firstWhere(
                                  (element) => element.name == productName,
                                ),
                              );
                            },
                            suggestions: provider.productsNames(),
                            backgroundColor: const Color.fromARGB(5, 0, 0, 0),
                            iconTheme:
                                const IconThemeData(color: Colors.black38),
                            onSearch: (value) => ss(
                              () => searchValue = value,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    //filterButton
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.5),
                      ),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [
                              0.3,
                              0.5,
                              0.7,
                              0.9,
                            ],
                            colors: [
                              Color.fromRGBO(235, 190, 170, 1),
                              Color.fromRGBO(235, 190, 170, 0.8),
                              Color.fromRGBO(235, 190, 170, 0.6),
                              Color.fromRGBO(235, 190, 170, 0.55),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.filter_alt_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                //shopbyCategory
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    Text(
                      'Shop by category',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'iosReg',
                        fontSize: 16,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.5),
                SizedBox(
                  height: 100,
                  child: CategoryList(),
                ),
                const SizedBox(height: 12.5),
                //shopbyBrand
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    Text(
                      'Shop by brand',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'iosReg',
                        fontSize: 16,
                        wordSpacing: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.5),
                SizedBox(
                  height: 100,
                  child: BrandGrid(),
                ),
              ],
            ),
          ),
        ],
        body: Container(
          color: Colors.white,
          child: provider.isAvailable(form.brand, form.category)
              ? Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.asset('./assets/images/comingsoon2.gif'),
                )
              : ListView(
                  padding: const EdgeInsets.only(top: 30),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 22.5, bottom: 5),
                      child: Text(
                        '${form.brand} Best Selling ${form.category}',
                        style: const TextStyle(
                          wordSpacing: 2,
                          color: Color.fromARGB(170, 0, 0, 0),
                          fontSize: 19,
                          fontFamily: 'iosReg',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: BestView(),
                    ),
                    const SizedBox(height: 20),
                    TypePopup(),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 2100,
                      child: ProdView(),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
