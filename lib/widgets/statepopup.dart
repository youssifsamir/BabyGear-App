//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

// ignore: must_be_immutable
class StatePopUp extends StatefulWidget {
  String selected;
  StatePopUp({super.key, required this.selected});
  @override
  State<StatePopUp> createState() => _StatePopUp();
}

class _StatePopUp extends State<StatePopUp> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);

    return Container(
      padding: const EdgeInsets.only(left: 10, right: 0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
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
          value: user.selected,
          items: user.states
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
          onChanged: (value) {
            widget.selected = value!;
            user.setSelected(value);
          },
        ),
      ),
    );
  }
}
