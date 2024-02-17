//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

//providers
import '/providers/accounts.dart';

// ignore: must_be_immutable
class BabiesBox extends StatelessWidget {
  final Baby baby;
  final Color color;
  String name = '', gender = '';
  double height = 0, weight = 0;
  int age = 0;
  DateTime birthDate = DateTime.now();
  bool isDateSelected = true, month = true, txt = false;
  Color borderColorW = Colors.black26, borderColorH = Colors.black26;
  final shakeKey = GlobalKey<ShakeWidgetState>();

  void validW(double w) {
    weight = w;
    borderColorW = Colors.black26;
  }

  void validH(double h) {
    height = h;
    borderColorH = Colors.black26;
  }

  void reset(Baby baby) {
    name = baby.name;
    gender = baby.gender;
    age = baby.age;
    height = baby.height;
    weight = baby.height;
    month = baby.months;
    birthDate = baby.dob;
    txt = false;
  }

  void edit(BuildContext context, AccountsProvider provider) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        reset(baby);
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            insetPadding: const EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Container(
              padding: const EdgeInsets.only(bottom: 15),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 0.85,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  "Edit ${baby.name}'s Details",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Freehand',
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            content: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 2.5,
              ),
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //name
                  Text(
                    "Baby's Name",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          name = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: InputDecoration(
                          hintText: baby.name,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  //gender
                  Text(
                    "Baby's Gender",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => Row(
                      children: [
                        const SizedBox(width: 40),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.blue,
                                ),
                                activeColor: Colors.blue,
                                value: 'Boy',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(
                                    () => gender = value.toString(),
                                  );
                                },
                              ),
                              const Text(
                                'Boy',
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: 'iosReg',
                                  color: Colors.blue,
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            children: <Widget>[
                              Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.pink,
                                ),
                                activeColor: Colors.pink,
                                value: 'Girl',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(
                                    () => gender = value.toString(),
                                  );
                                },
                              ),
                              const Text(
                                'Girl',
                                style: TextStyle(
                                  fontFamily: 'iosReg',
                                  color: Colors.pink,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  //DOB
                  StatefulBuilder(
                    builder: (context, setState) => GestureDetector(
                      onTap: () async {
                        final datePick = await showDatePicker(
                          builder: (context, child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme(
                                  primary: Theme.of(context).primaryColor,
                                  brightness: Brightness.light,
                                  onPrimary: Colors.white,
                                  secondary: Colors.white,
                                  onSecondary: Colors.white,
                                  error: Colors.red,
                                  onError: Colors.red,
                                  background: Colors.white,
                                  onBackground: Colors.white,
                                  surface: Theme.of(context).primaryColor,
                                  onSurface: Colors.black54,
                                ),
                              ),
                              child: child!,
                            );
                          },
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(DateTime.now().year - 3),
                          lastDate: DateTime(
                            DateTime.now().year,
                            DateTime.now().month,
                            DateTime.now().day,
                          ),
                        );
                        if (datePick != null && datePick != baby.dob) {
                          setState(
                            () {
                              if ((DateTime.now().year - baby.dob.year).abs() ==
                                  1) {
                                age = (DateTime.now().month - baby.dob.month)
                                        .abs() +
                                    12;
                                baby.months = true;
                              } else if ((DateTime.now().year - baby.dob.year)
                                      .abs() ==
                                  0) {
                                age = (DateTime.now().month - baby.dob.month)
                                    .abs();
                                month = true;
                              } else {
                                age =
                                    (DateTime.now().year - baby.dob.year).abs();
                                month = false;
                              }
                              birthDate = datePick;
                              isDateSelected = true;
                            },
                          );
                        }
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Baby's Birthday:",
                            style: TextStyle(
                              fontSize: 17,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'iosReg',
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            '${birthDate.toString().substring(0, 4)}/${birthDate.toString().substring(5, 7)}/${birthDate.toString().substring(8, 10)}',
                            style: const TextStyle(
                              fontFamily: 'iosReg',
                              color: Colors.black38,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.calendar_month_sharp,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  //body
                  StatefulBuilder(
                    builder: (context, setState) => Flexible(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          //weight
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Baby's Weight",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'iosReg',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(2.5),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        left: BorderSide(
                                          color: borderColorW,
                                          width: 1,
                                        ),
                                        top: BorderSide(
                                          color: borderColorW,
                                          width: 1,
                                        ),
                                        bottom: BorderSide(
                                          color: borderColorW,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    height: 30,
                                    width: 100,
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(
                                            r"[0-9.]",
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) => setState(
                                        () {
                                          double.parse(value) < 0 ||
                                                  double.parse(value) >= 100
                                              ? borderColorW = Colors.red
                                              : validW(
                                                  double.parse(value),
                                                );
                                        },
                                      ),
                                      maxLines: 1,
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: baby.weight.toString(),
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'iosReg',
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 11.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      border: Border.all(
                                        color: borderColorW,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Text(
                                      'KG',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'iosReg',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          //height
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Baby's Height",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: 'iosReg',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        left: BorderSide(
                                          color: borderColorH,
                                          width: 1,
                                        ),
                                        top: BorderSide(
                                          color: borderColorH,
                                          width: 1,
                                        ),
                                        bottom: BorderSide(
                                          color: borderColorH,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    height: 30,
                                    width: 100,
                                    child: TextField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(
                                            r"[0-9.]",
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) => setState(() {
                                        double.parse(value) < 0 ||
                                                double.parse(value) >= 100
                                            ? borderColorH = Colors.red
                                            : validH(
                                                double.parse(value),
                                              );
                                      }),
                                      cursorColor:
                                          Theme.of(context).primaryColor,
                                      decoration: InputDecoration(
                                        hintText: baby.height.toString(),
                                        hintMaxLines: 1,
                                        border: InputBorder.none,
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          // fontFamily: 'iosReg',
                                        ),
                                        contentPadding: const EdgeInsets.only(
                                          left: 10,
                                          bottom: 11.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    padding: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      border: Border.all(
                                        color: borderColorH,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Text(
                                      'CM',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'iosReg',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Visibility(
                    visible: txt,
                    child: const Text(
                      ' Please Fill In All Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: 'Open Sans',
                        fontSize: 12,
                      ),
                    ),
                  ),
                  //bottomText
                  const Text(
                    ' Recommendations for your baby will be provided.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Open Sans',
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 15),
                  //buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //cancel
                      GestureDetector(
                        onTap: () {
                          reset(baby);
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 133.5,
                          height: 35,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(41, 0, 0, 0),
                                blurRadius: 4,
                                offset: Offset(2, 10),
                              ),
                            ],
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),

                      //add
                      GestureDetector(
                        onTap: () {
                          if (name != '' &&
                              gender != '' &&
                              (weight != 0 && weight < 100) &&
                              (height != 0 && height < 100)) {
                            provider.editBaby(
                              baby.id,
                              name,
                              gender,
                              birthDate,
                              age,
                              month,
                              weight,
                              height,
                            );
                            Navigator.pop(context);
                          } else {
                            setState(() {
                              HapticFeedback.heavyImpact();
                              shakeKey.currentState?.shake();
                              txt = true;
                            });
                          }
                        },
                        child: ShakeMe(
                          key: shakeKey,
                          shakeCount: 3,
                          shakeOffset: 5,
                          shakeDuration: const Duration(milliseconds: 350),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 133.5,
                            height: 35,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(
                                    41,
                                    0,
                                    0,
                                    0,
                                  ),
                                  blurRadius: 4,
                                  offset: Offset(2, 10),
                                ),
                              ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ignore: use_key_in_widget_constructors
  BabiesBox({required this.baby, required this.color});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(41, 0, 0, 0),
                    blurRadius: 4,
                    offset: Offset(2, 10),
                  ),
                ],
                border: Border.all(
                  width: 1.5,
                  color: Theme.of(context).primaryColor,
                  // color: const Color.fromRGBO(229, 190, 170, 1),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  //image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                      child: Container(
                        color: Colors.white,
                        width: 110,
                        height: 110,
                        child: Image.asset(
                          baby.gender == 'Boy'
                              ? './assets/images/boy.png'
                              : './assets/images/girl.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  //detials
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //name
                      Text(
                        baby.name,
                        style: const TextStyle(
                          color: Color.fromARGB(153, 0, 0, 0),
                          fontSize: 24,
                          fontFamily: 'Freehand',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 7),
                      //age&gender
                      Row(
                        children: <Widget>[
                          const Text(
                            'Age:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            baby.months
                                ? baby.age == 0
                                    ? 'New Born'
                                    : '${baby.age.toString()} months'
                                : '${baby.age.toString()} years',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Gender:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            baby.gender,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      //weight&height
                      Row(
                        children: <Widget>[
                          const Text(
                            'Weight:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${baby.weight.toString()} kg',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 8.5),
                          const Text(
                            'Height:',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${baby.height} cm',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 60,
              child: GestureDetector(
                onTap: () => edit(context, provider),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 16.5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.pencil,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  provider.deleteBaby(baby);
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 16.5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: FaIcon(
                      FontAwesomeIcons.trash,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15)
        // SizedBox(
        //   height: 25,
        //   width: 200,
        //   child: Divider(
        //     color: color,
        //     height: 0,
        //   ),
        // ),
      ],
    );
  }
}
