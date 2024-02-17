//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import '/providers/subscriptions.dart';

//widgets
import 'offers.dart';

class OffersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () => provider.setSelected(index),
          child: OfferBox(
            plan: provider.plans[index],
            cost: provider.getPage() == 2 && provider.getType() == 1
                ? provider.costD[index]
                : provider.getPage() == 2 && provider.getType() == 0
                    ? provider.costB[index]
                    : provider.cost[index],
            selected: provider.selected == index ? true : false,
            page: provider.getPage(),
          ),
        );
      },
      itemCount: provider.getPage() == 2
          ? provider.plans.length - 1
          : provider.plans.length,
    );
  }
}
