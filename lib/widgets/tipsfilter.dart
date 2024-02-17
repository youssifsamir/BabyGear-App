//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/tips.dart';

//widgets
import '/widgets/tipsbox.dart';

class TipsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TipsProvider>(context);
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 0.32,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            provider.setSelected(index);
            provider.setCategory(provider.Type[index]);
          },
          child: TipsBox(
            type: provider.Type[index],
            selected: index == provider.getSelected() ? 80 : 0,
            colour: index == provider.getSelected()
                ? const Color.fromRGBO(229, 190, 170, 1)
                : Colors.white,
            txtcolour: index == provider.getSelected()
                ? const Color.fromRGBO(229, 190, 170, 1)
                : Colors.black45,
          ),
        );
      },
      itemCount: provider.Type.length,
    );
  }
}
