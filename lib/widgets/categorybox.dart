//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//provider
import '/providers/form.dart';

class CategoryBox extends StatelessWidget {
  final String image, type;
  CategoryBox({
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormProvider>(context);

    return GestureDetector(
      onTap: () {
        provider.setType('All');
        provider.category == type
            ? provider.setCategory('')
            : provider.setCategory(type);
      },
      child: Column(
        children: <Widget>[
          AnimatedContainer(
            margin: EdgeInsets.only(top: provider.category == type ? 4.5 : 0),
            duration: const Duration(milliseconds: 225),
            width: provider.category == type ? 62.5 : 72,
            height: provider.category == type ? 62.5 : 72,
            decoration: BoxDecoration(
              color: provider.category == type
                  ? const Color.fromRGBO(235, 190, 170, 0.25)
                  : Colors.white,
              border: Border.all(
                color: provider.category == type
                    ? const Color.fromRGBO(235, 190, 170, 0.25)
                    : const Color.fromARGB(10, 0, 0, 0),
                width: provider.category == type ? 0 : 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(provider.category == type ? 7 : 7),
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
              fontFamily: 'iosReg',
              color: provider.category == type
                  ? const Color.fromRGBO(235, 190, 170, 1)
                  : const Color.fromARGB(180, 0, 0, 0),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
