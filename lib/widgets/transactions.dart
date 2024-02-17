//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/products/prodgate.dart';

//widgets
import '/widgets/transactionbox.dart';

// ignore: use_key_in_widget_constructors
class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return provider.getByUsername(provider.currentUser).rents.isEmpty
        ? Column(
            children: <Widget>[
              const SizedBox(height: 70),
              Image.asset(
                './assets/images/history.gif',
                width: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'You have no transactions',
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
              return TransactionBox(
                transaction:
                    provider.getByUsername(provider.currentUser).history[index],
                color: index ==
                        provider
                                .getByUsername(provider.currentUser)
                                .history
                                .length -
                            1
                    ? Colors.white
                    : Colors.black38,
              );
            },
            itemCount:
                provider.getByUsername(provider.currentUser).history.length,
          );
  }
}
