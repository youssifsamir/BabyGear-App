//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class ColourBX extends StatelessWidget {
  final Color colour;
  final int index;
  ColourBX({
    required this.index,
    required this.colour,
  });

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    return GestureDetector(
      onTap: () => form.setProdColour(index),
      child: CircleAvatar(
        backgroundColor: colour,
      ),
    );
  }
}
