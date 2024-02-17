//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class RentBox extends StatelessWidget {
  final String image, type;
  RentBox({
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return GestureDetector(
      onTap: () => provider.setCategory(type),
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: provider.category == type
                    ? Theme.of(context).primaryColor
                    : Colors.black26,
                width: provider.category == type ? 2 : 0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            type,
            style: TextStyle(
              color: provider.category == type
                  ? Theme.of(context).primaryColor
                  : const Color.fromARGB(180, 0, 0, 0),
              fontSize: 13.5,
            ),
          ),
        ],
      ),
    );
  }
}
