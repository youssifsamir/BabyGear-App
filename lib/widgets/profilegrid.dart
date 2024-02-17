//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/profilebox.dart';

// ignore: use_key_in_widget_constructors
class ProfileGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return Container(
      color: Colors.white,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio: 0.19,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              provider.updateBody(index);
            },
            child: ProfileBox(
              type: provider.Type[index],
              selected: provider.index == index,
            ),
          );
        },
        itemCount: provider.Type.length,
      ),
    );
  }
}
