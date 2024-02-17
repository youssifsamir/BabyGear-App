//packages
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_field/intl_phone_field.dart';
// ignore: depend_on_referenced_packages
import 'package:intl_phone_field/country_picker_dialog.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/switchbutton.dart';

// ignore: use_key_in_widget_constructors
class SettingsScreen extends StatefulWidget {
  static final routeName = './settings.dart';

  @override
  State<SettingsScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<SettingsScreen> {
  bool show1 = false,
      show2 = false,
      show0 = false,
      notMatching = false,
      invalid = false,
      confirm = false,
      index = false,
      notOld = false,
      codeError = false;
  String old = '', pass1 = '', pass2 = '', phoneNumber = '', code = '';

  Random random = Random();
  int randomNumber = 0;

  final shakeKey = GlobalKey<ShakeWidgetState>();

  void reset() {
    setState(
      () {
        show0 = false;
        old = '';
        notOld = false;
        confirm = false;
        pass1 = '';
        pass2 = '';
        show1 = false;
        show2 = false;
        invalid = false;
        notMatching = false;
      },
    );
  }

  void changePassword(BuildContext context, AccountsProvider user) {
    showModalBottomSheet(
      enableDrag: confirm ? true : false,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context2) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          height: 515 + MediaQuery.of(context).viewInsets.bottom,
          child: StatefulBuilder(
            builder: (context, setState) => confirm
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                        child: SizedBox(
                          width: 200,
                          child: Image.asset(
                            './assets/images/sucess.gif',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        'Password Changed!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 107, 180, 4),
                          fontFamily: 'Baby',
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Center(
                        child: Text(
                          'Your password has been changed successfully.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'Open Sans',
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontFamily: 'Freehand',
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const Center(
                        child: SizedBox(
                          height: 35,
                          width: 300,
                          child: Divider(
                            color: Colors.black26,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        '      Old Password',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 5),

                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.03),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                onChanged: (value) =>
                                    setState(() => old = value),
                                cursorColor: Theme.of(context).primaryColor,
                                obscureText: show0 ? false : true,
                                style: TextStyle(fontSize: show0 ? 17 : 22),
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'\s'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              right: 20,
                              child: GestureDetector(
                                onTap: () => setState(() => show0 = !show0),
                                child: Icon(
                                  show0
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '      New Password',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 5),

                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.03),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                onChanged: (value) =>
                                    setState(() => pass1 = value),
                                cursorColor: Theme.of(context).primaryColor,
                                obscureText: show1 ? false : true,
                                style: TextStyle(fontSize: show1 ? 17 : 22),
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'\s'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              right: 20,
                              child: GestureDetector(
                                onTap: () => setState(() => show1 = !show1),
                                child: Icon(
                                  show1
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '      Confirm New Password',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 5),

                      Center(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 350,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.03),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: TextField(
                                onChanged: (value) =>
                                    setState(() => pass2 = value),
                                cursorColor: Theme.of(context).primaryColor,
                                obscureText: show2 ? false : true,
                                style: TextStyle(fontSize: show2 ? 17 : 22),
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                    RegExp(r'\s'),
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 9,
                              right: 20,
                              child: GestureDetector(
                                onTap: () => setState(() => show2 = !show2),
                                child: Icon(
                                  show2
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      //errorText
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 25),
                          ShakeMe(
                            key: shakeKey,
                            shakeCount: 2,
                            shakeOffset: 5,
                            shakeDuration: const Duration(milliseconds: 250),
                            child: Text(
                              notMatching
                                  ? 'Passwords do not match'
                                  : invalid
                                      ? 'New password is same as old password'
                                      : notOld
                                          ? 'Incorrect old password'
                                          : '',
                              style: const TextStyle(
                                color: Colors.red,
                                fontFamily: 'Open Sans',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: invalid
                                ? 15
                                : notOld
                                    ? 110
                                    : notMatching
                                        ? 82.5
                                        : 220,
                          ),
                          const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'iosReg',
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 30),

                      // buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //cancelButton
                          GestureDetector(
                            onTap: () {
                              setState(() => reset());
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 55,
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(41, 0, 0, 0),
                                    blurRadius: 4,
                                    offset: Offset(2, 10), // Shadow position
                                  ),
                                ],
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18,
                                    fontFamily: 'Baby',
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          //saveButton
                          GestureDetector(
                            onTap: () {
                              if (pass1 == '' || pass2 == '' || old == '') {
                              } else if (old !=
                                  user
                                      .getByUsername(user.currentUser)
                                      .password) {
                                setState(() {
                                  notMatching = false;
                                  invalid = false;
                                  notOld = true;
                                });
                                HapticFeedback.heavyImpact();
                                shakeKey.currentState?.shake();
                                return;
                              } else if (pass1 == pass2) {
                                if (pass1 ==
                                    user
                                        .getByUsername(user.currentUser)
                                        .password) {
                                  HapticFeedback.heavyImpact();
                                  shakeKey.currentState?.shake();

                                  setState(() {
                                    notOld = false;
                                    notMatching = false;
                                    invalid = true;
                                  });
                                  return;
                                }
                                HapticFeedback.mediumImpact();
                                user.changePassword(pass1);
                                setState(
                                  () => confirm = true,
                                );
                                Timer(const Duration(seconds: 3), () {
                                  Navigator.pop(context);
                                  reset();
                                });
                              } else {
                                shakeKey.currentState?.shake();
                                HapticFeedback.heavyImpact();
                                setState(() {
                                  notOld = false;
                                  invalid = false;
                                  notMatching = true;
                                });
                              }
                            },
                            child: Container(
                              height: 55,
                              width: 160,
                              decoration: BoxDecoration(
                                color: pass1 != '' && pass2 != '' && old != ''
                                    ? const Color.fromRGBO(70, 150, 151, 1)
                                    : const Color.fromRGBO(70, 150, 151, 0.5),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        pass1 != '' && pass2 != '' && old != ''
                                            ? const Color.fromARGB(41, 0, 0, 0)
                                            : const Color.fromARGB(0, 0, 0, 0),
                                    blurRadius: 4,
                                    offset:
                                        const Offset(2, 10), // Shadow position
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Baby',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }

  void changephone(BuildContext context, AccountsProvider user) {
    showModalBottomSheet(
      enableDrag: true,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context2) {
        return Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          height: 310 + MediaQuery.of(context).viewInsets.bottom,
          child: StatefulBuilder(
            builder: (context, setState) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'Change Mobile Number',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Freehand',
                      fontSize: 25,
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 35,
                    width: 300,
                    child: Divider(
                      color: Colors.black26,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                //phone number
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: !index
                        ? IntlPhoneField(
                            pickerDialogStyle: PickerDialogStyle(
                              backgroundColor: Colors.white,
                              searchFieldInputDecoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black26,
                                  ),
                                ),
                                fillColor: Theme.of(context).primaryColor,
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Theme.of(context).primaryColor,
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 10),
                              ),
                              searchFieldCursorColor:
                                  Theme.of(context).primaryColor,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                  r"[0-9.]",
                                ),
                              ),
                            ],
                            autovalidateMode: null,
                            onChanged: (value) => setState(() => phoneNumber =
                                '${value.countryCode}' '${value.number}'),
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              iconColor: Colors.black26,
                              labelStyle: TextStyle(
                                color: phoneNumber.isNotEmpty
                                    ? Colors.white
                                    : Colors.black38,
                              ),
                              border: InputBorder.none,
                              labelText: 'Mobile Number',
                              prefixIconColor: Colors.black38,
                            ),
                            initialCountryCode: 'EG',
                          )
                        : TextField(
                            onChanged: (value) => setState(() => code = value),
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(
                                  r"[0-9.]",
                                ),
                              ),
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 25),
                              border: InputBorder.none,
                              hintText: 'Code sent to $phoneNumber',
                              hintStyle: const TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 30),

                // buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //cancelButton
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        setState(() => phoneNumber = '');
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 55,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(2, 10),
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontFamily: 'Baby',
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    //saveButton
                    GestureDetector(
                      onTap: () {
                        if ((phoneNumber.length == 13 && !index) ||
                            (code.length == 6 && index)) {
                          setState(() => index = !index);

                          if (code.length == 6) {
                            HapticFeedback.mediumImpact();
                            user.changePhone(phoneNumber);

                            setState(() {
                              phoneNumber = '';
                              codeError = false;
                            });
                            Navigator.pop(context);
                          } else {
                            codeError = true;
                          }
                        } else {}
                      },
                      child: Container(
                        height: 55,
                        width: 160,
                        decoration: BoxDecoration(
                          color: (phoneNumber.length == 13 && !index) ||
                                  (code.length == 6 && index)
                              ? const Color.fromRGBO(70, 150, 151, 1)
                              : const Color.fromRGBO(70, 150, 151, 0.5),
                          boxShadow: [
                            BoxShadow(
                              color: (phoneNumber.length == 13 && !index) ||
                                      (code.length == 6 && index)
                                  ? const Color.fromARGB(41, 0, 0, 0)
                                  : const Color.fromARGB(0, 0, 0, 0),
                              blurRadius: 4,
                              offset: const Offset(2, 10),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            index ? 'Save' : "Continue",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Baby',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontFamily: 'Freehand',
              fontSize: 30),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //account
            const Text(
              '      ACCOUNT',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Open Sans',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),

            //password
            GestureDetector(
              onTap: () => changePassword(context, user),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 22),
                  Text(
                    'Change Password',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontFamily: 'Baby',
                    ),
                  ),
                  const SizedBox(width: 156.5),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //phone
            GestureDetector(
              onTap: () => changephone(context, user),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 22),
                  Text(
                    'Change Mobile Number',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontFamily: 'Baby',
                    ),
                  ),
                  const SizedBox(width: 110),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black26,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 15),
            //notifications
            const Text(
              '      NOTIFICATIONS',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Open Sans',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //pushNotifications
            Row(
              children: <Widget>[
                const SizedBox(width: 22),
                Text(
                  'Push Notifications',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontFamily: 'Baby',
                  ),
                ),
                const SizedBox(width: 98),
                SwitchButton(
                  setting: 0,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 15),
            //privacy
            const Text(
              '      PRIVACY',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Open Sans',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //location
            Row(
              children: <Widget>[
                const SizedBox(width: 22),
                Text(
                  'Allow Location Access',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontFamily: 'Baby',
                  ),
                ),
                const SizedBox(width: 60),
                SwitchButton(
                  setting: 1,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //camera
            Row(
              children: <Widget>[
                const SizedBox(width: 22),
                Text(
                  'Allow Camera Access',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontFamily: 'Baby',
                  ),
                ),
                const SizedBox(width: 71),
                SwitchButton(
                  setting: 2,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //gallery
            Row(
              children: <Widget>[
                const SizedBox(width: 22),
                Text(
                  'Allow Gallery Access',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontFamily: 'Baby',
                  ),
                ),
                const SizedBox(width: 72.5),
                SwitchButton(
                  setting: 3,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),

            const SizedBox(height: 15),

            //newsletter
            const Text(
              '      NEWS LETTER',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Open Sans',
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 30,
              child: Divider(
                color: Color.fromARGB(40, 0, 0, 0),
              ),
            ),
            //receiveLetters
            Row(
              children: <Widget>[
                const SizedBox(width: 22),
                Text(
                  'Recieve News Letters',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontFamily: 'Baby',
                  ),
                ),
                const SizedBox(width: 74),
                SwitchButton(
                  setting: 4,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              '       Letters will be sent weekly to your email.',
              style: TextStyle(
                color: Colors.black26,
                fontFamily: 'Open Sans',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
