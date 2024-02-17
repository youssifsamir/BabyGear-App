//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/form.dart';
import '/providers/products.dart';

enum FilterOptions {
  expensive,
  cheap,
  recent,
}

// ignore: use_key_in_widget_constructors
class TypePopup extends StatefulWidget {
  @override
  State<TypePopup> createState() => _TypePopup();
}

class _TypePopup extends State<TypePopup> {
  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    final provider = Provider.of<ProductsProvider>(context);
    List<String> items = provider.getTypes(form.brand, form.category).toList();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: 350,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(15, 0, 0, 0),
        ),
      ),
      child: StatefulBuilder(
        builder: (context, setState) => DropdownButton<String>(
          underline: Container(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Color.fromARGB(50, 0, 0, 0),
          ),
          value: form.type,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: <Widget>[
                      Text(
                        item,
                        style: const TextStyle(
                          color: Color.fromARGB(170, 0, 0, 0),
                          fontFamily: 'iosReg',
                        ),
                      ),
                      const SizedBox(width: 145),
                    ],
                  ),
                ),
              )
              .toList(),
          onChanged: (value) => form.setType(value!),
        ),
      ),
    );
  }
}
