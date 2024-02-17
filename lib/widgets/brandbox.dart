//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class BrandBX extends StatelessWidget {
  final String image, name;
  BrandBX({
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);
    return GestureDetector(
      onTap: () {
        provider.brand == name
            ? provider.setBrand('')
            : provider.setBrand(name);
      },
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            margin: EdgeInsets.only(top: provider.brand == name ? 4.5 : 0),
            duration: const Duration(milliseconds: 225),
            width: provider.brand == name ? 62.5 : 72,
            height: provider.brand == name ? 62.5 : 72,
            decoration: BoxDecoration(
              color: provider.brand == name
                  ? const Color.fromRGBO(235, 190, 170, 0.25)
                  : Colors.white,
              border: Border.all(
                color: provider.brand == name
                    ? const Color.fromRGBO(235, 190, 170, 0.25)
                    : const Color.fromARGB(10, 0, 0, 0),
                width: provider.brand == name ? 0 : 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(provider.brand == name ? 7 : 7),
              ),
            ),
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(height: 5),
          FittedBox(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'iosReg',
                color: provider.brand == name
                    ? const Color.fromRGBO(235, 190, 170, 1)
                    : Colors.black54,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
