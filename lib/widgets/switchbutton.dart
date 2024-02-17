//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

// ignore: must_be_immutable
class SwitchButton extends StatefulWidget {
  int setting;
  // ignore: use_key_in_widget_constructors
  SwitchButton({required this.setting});
  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);

    return GestureDetector(
      onTap: () {
        HapticFeedback.heavyImpact();
        setState(() => user.changeSettings(widget.setting));
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: user.getSetting(widget.setting)
              ? const Color.fromARGB(149, 76, 175, 79)
              : const Color.fromARGB(133, 244, 67, 54),
        ),
        duration: const Duration(milliseconds: 500),
        height: 25,
        width: 75,
        curve: Curves.bounceOut,
        padding: EdgeInsets.only(
          left: user.getSetting(widget.setting) ? 50 : 0,
          right: user.getSetting(widget.setting) ? 0 : 50.5,
        ),
        child: Image.asset(
          user.getSetting(widget.setting)
              ? './assets/images/on.tiff'
              : './assets/images/off.tiff',
        ),
      ),
    );
  }
}
