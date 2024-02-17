//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/products.dart';

import '/screens/products/prodgate.dart';

//screens
// ignore: duplicate_import
import '/screens/products/prodgate.dart';
import '/screens/products/prodetails.dart';

//widgets
import '/widgets/favbox.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsProvider>(context);
    return Container(
      color: Colors.white,
      child: provider.favorites.isEmpty
          ? Column(
              children: <Widget>[
                const SizedBox(height: 50),
                Image.asset(
                  './assets/images/nofav.gif',
                ),
                const Text(
                  'You have no favorite items',
                  style: TextStyle(
                    wordSpacing: 1,
                    fontFamily: 'Open Sans',
                    color: Colors.black38,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ProdGate.routeName),
                  child: const Text(
                    'Explore our products & order now!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontFamily: 'Open Sans',
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Text(
                      'You have ${provider.favorites.length} favorite items',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 61),
                    GestureDetector(
                      onTap: () => provider.deleteFav(),
                      child: const Row(
                        children: <Widget>[
                          Text(
                            'Unfavorite All',
                            style: TextStyle(
                              wordSpacing: 1,
                              color: Colors.pink,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.heart_broken,
                            size: 20,
                            color: Colors.pink,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(
                      left: 5,
                      bottom: 50,
                    ),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 30,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ProdDetails.routeName,
                          arguments: provider.favorites[index],
                        ),
                        child: FavBox(
                          prod: provider.favorites[index],
                        ),
                      );
                    },
                    itemCount: provider.favorites.length,
                  ),
                ),
              ],
            ),
    );
  }
}
