//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/location.dart';

// ignore: use_key_in_widget_constructors
class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return provider.getByUsername(provider.currentUser).locations.isEmpty
        ? const Center(
            child: Text(
              'You have no locations saved',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'iosReg',
                fontSize: 16,
              ),
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(0),
            itemBuilder: (ctx, index) {
              return Column(
                children: <Widget>[
                  LocationBox(
                    location: provider
                        .getByUsername(provider.currentUser)
                        .locations[index],
                    last: provider
                                .getByUsername(provider.currentUser)
                                .locations
                                .length -
                            1 ==
                        index,
                  ),
                ],
              );
            },
            itemCount:
                provider.getByUsername(provider.currentUser).locations.length,
          );
  }
}
