//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

//providers
import '/providers/accounts.dart';
import '/providers/bottomappbar.dart';

// ignore: use_key_in_widget_constructors
class AddBaby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountsProvider>(context);
    final provider = Provider.of<BottomAppBarProvider>(context);
    String name = '', gender = '';
    double height = 0, weight = 0;
    int age = 0;
    String birthDateInString = 'DD-MM-YYYY';
    DateTime birthDate = DateTime.now();
    bool month = true, txt = false;
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

    void reset() {
      name = '';
      gender = '';
      age = 0;
      birthDateInString = 'DD-MM-YYYY';
      height = 0;
      weight = 0;
      month = false;
      txt = false;
      borderColorH = Colors.black26;
      borderColorW = Colors.black26;
    }

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        account.updateBody(1);
        provider.updateBody(3);

        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
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
                      'Add Your Baby',
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
                        child: TextField(
                          onChanged: (value) => setState(
                            () {
                              name = value;
                            },
                          ),
                          maxLines: 1,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 10, bottom: 15),
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
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Boy',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 16,
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
                                      setState(() {
                                        gender = value.toString();
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Girl',
                                    style: TextStyle(
                                      fontSize: 16,
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
                            if (datePick != null && datePick != birthDate) {
                              setState(
                                () {
                                  if ((DateTime.now().year - birthDate.year)
                                          .abs() ==
                                      1) {
                                    age =
                                        (DateTime.now().month - birthDate.month)
                                                .abs() +
                                            12;
                                    month = true;
                                  } else if ((DateTime.now().year -
                                              birthDate.year)
                                          .abs() ==
                                      0) {
                                    age =
                                        (DateTime.now().month - birthDate.month)
                                            .abs();
                                    month = true;
                                  } else {
                                    age = (DateTime.now().year - birthDate.year)
                                        .abs();
                                    month = false;
                                  }
                                  birthDate = datePick;
                                  birthDateInString =
                                      "${birthDate.day}/${birthDate.month}/${birthDate.year}";
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
                                birthDateInString,
                                style: const TextStyle(
                                  fontFamily: 'iosReg',
                                  color: Colors.black26,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.calendar_month_sharp,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
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
                                        padding: const EdgeInsets.all(2),
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
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                              left: 10,
                                              bottom: 15,
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
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                              left: 10,
                                              bottom: 15,
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
                          ' Please fill in all details correctly.',
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
                              reset();
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
                                    fontFamily: 'Open Sans',
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
                                  birthDateInString != 'DD/MM/YYYY' &&
                                  weight != 0 &&
                                  height != 0) {
                                account.addBaby(name, gender, birthDate, age,
                                    month, weight, height);
                                reset();
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
                                    'Add',
                                    style: TextStyle(
                                      fontFamily: 'Open Sans',
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
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 30, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //image
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            //detials
            const SizedBox(
              width: 100,
              child: Text(
                'Add baby',
                style: TextStyle(
                  color: Color.fromARGB(153, 0, 0, 0),
                  fontSize: 22,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
