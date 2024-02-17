//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/products/prodgate.dart';

//widgets
import '/widgets/ordersbox.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return provider.getByUsername(provider.currentUser).transactions.isEmpty
        ? Column(
            children: <Widget>[
              const SizedBox(height: 50),
              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  './assets/images/orders.gif',
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'You have no orders',
                style: TextStyle(
                  color: Colors.black38,
                  fontFamily: 'Open Sans',
                  fontSize: 15,
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
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return OrdersBox(
                transaction: provider
                    .getByUsername(provider.currentUser)
                    .transactions[index],
                color: index ==
                        provider
                                .getByUsername(provider.currentUser)
                                .transactions
                                .length -
                            1
                    ? Colors.white
                    : Colors.black38,
              );
            },
            itemCount: provider
                .getByUsername(provider.currentUser)
                .transactions
                .length,
          );
  }
}
