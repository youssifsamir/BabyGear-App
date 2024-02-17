//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class BrandBox extends StatelessWidget {
  final String image, name;
  BrandBox({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);
    return GestureDetector(
      onTap: () => provider.setBrand(name),
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: provider.brand == name
                    ? Theme.of(context).primaryColor
                    : Colors.black26,
                width: provider.brand == name ? 2 : 0,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Open Sans',
                color: provider.brand == name
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
