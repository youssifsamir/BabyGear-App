//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/subscriptions.dart';

//widgets
import '../widgets/subadbox.dart';

class SubAds extends StatelessWidget {
  const SubAds({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubscriptionProvider>(context);
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 500,
        childAspectRatio: 0.95,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SubAdBox(
          subscription: provider.subs[index],
        );
      },
      itemCount: 3,
    );
  }
}
