//packages
import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  final String type;
  final bool selected;

  // ignore: use_key_in_widget_constructors
  const ProfileBox({required this.type, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOutSine,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 0,
          color: selected
              ? const Color.fromARGB(255, 28, 145, 141)
              : Colors.black26,
        ),
        color:
            selected ? const Color.fromARGB(155, 28, 145, 141) : Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            type,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black45,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
