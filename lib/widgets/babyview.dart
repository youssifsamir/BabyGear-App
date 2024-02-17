//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/nobaby.dart';
import '/widgets/babybox.dart';

class BabyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return provider.getByUsername(provider.currentUser).babies.isEmpty
        ? NoBaby()
        : ListView.builder(
            padding: const EdgeInsets.all(0),
            itemBuilder: (ctx, index) {
              return BabyBox(
                  baby: provider
                      .getByUsername(provider.currentUser)
                      .babies[index],
                  last: provider
                              .getByUsername(provider.currentUser)
                              .babies
                              .length -
                          1 ==
                      index);
            },
            itemCount:
                provider.getByUsername(provider.currentUser).babies.length,
          );
  }
}
