//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/tips.dart';

//widgets
import '/widgets/stepsbox.dart';

class StepsList extends StatelessWidget {
  const StepsList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TipsProvider>(context);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 30),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: StepsBox(
            left: (index + 1) % 2 == 0,
            title: provider.Tips[0].steps[index],
            image: provider.Tips[0].imgs[index],
            text: provider.Tips[0].details[index],
          ),
        );
      },
      itemCount: provider.Tips[0].steps.length,
    );
  }
}
