//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class ImgBX extends StatelessWidget {
  final String image;
  final int index;
  ImgBX({
    required this.index,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    return GestureDetector(
      onTap: () => form.setImg(index),
      child: Column(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: const Color.fromARGB(10, 0, 0, 0),
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              image,
            ),
          ),
        ],
      ),
    );
  }
}
