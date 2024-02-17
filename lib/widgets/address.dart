//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/addressbox.dart';
import '/widgets/statepopup.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ManageAddress extends StatelessWidget {
  String state = '',
      city = '',
      street = '',
      building = '',
      floor = '',
      apartment = '',
      landmark = '',
      description = '',
      country = 'Egypt';

  bool txt = false;

  final shakeKey = GlobalKey<ShakeWidgetState>();

  void reset(AccountsProvider user) {
    txt = false;
    state = '';
    city = '';
    street = '';
    building = '';
    floor = '';
    apartment = '';
    landmark = '';
    description = '';
  }

  void add(BuildContext context, AccountsProvider provider) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        reset(provider);
        return StatefulBuilder(
          builder: (context, setState) => AlertDialog(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
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
                  'Add New Address',
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
              ),
              height: 665,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //state
                  Text(
                    "State",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: StatePopUp(selected: provider.states[0]),
                  ),
                  const SizedBox(height: 10),
                  //city
                  Text(
                    "City",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          city = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //street
                  Text(
                    "Street",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          street = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //street
                  Text(
                    "Building",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          building = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //building/floor/apartment
                  StatefulBuilder(
                    builder: (context, setState) => Row(
                      children: <Widget>[
                        //floorNo
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Floor No.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                            const SizedBox(height: 7.5),
                            Container(
                              padding: const EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  border: Border.all(color: Colors.black12)),
                              height: 30,
                              width: 130,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                      r"[0-9.]",
                                    ),
                                  ),
                                ],
                                onChanged: (value) => setState(
                                  () => floor = value.toString(),
                                ),
                                maxLines: 1,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'iosReg',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 10,
                                    bottom: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Apartment No.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                            const SizedBox(height: 7.5),
                            Container(
                              padding: const EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                                border: Border.all(color: Colors.black12),
                              ),
                              height: 30,
                              width: 130,
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                      r"[0-9.]",
                                    ),
                                  ),
                                ],
                                onChanged: (value) => setState(
                                  () => apartment = value.toString(),
                                ),
                                maxLines: 1,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'iosReg',
                                  ),
                                  contentPadding: EdgeInsets.only(
                                    left: 10,
                                    bottom: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  //landmark
                  Text(
                    "Landmark",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          landmark = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //description
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                  const SizedBox(height: 7.5),
                  Container(
                    width: 350,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => setState(() {
                          description = value;
                        }),
                        maxLines: 1,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Visibility(
                    visible: txt,
                    child: const Text(
                      ' Please Fill In All Details.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: 'Open Sans',
                        fontSize: 12,
                      ),
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
                          reset(provider);
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
                          if (city.trim() != '' &&
                              building.trim() != '' &&
                              landmark.trim() != '' &&
                              apartment.trim() != '' &&
                              floor.trim() != '' &&
                              street.trim() != '' &&
                              description.trim() != '') {
                            provider.addAddress(
                              provider
                                      .getByUsername(provider.currentUser)
                                      .locations
                                      .length +
                                  1,
                              provider.selected,
                              city.trim(),
                              street.trim(),
                              building.trim(),
                              floor.trim(),
                              apartment.trim(),
                              landmark.trim(),
                              description.trim(),
                              country,
                            );
                            reset(provider);
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

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //addNewAddress
            GestureDetector(
              onTap: () => add(context, provider),
              child: Text(
                'Add New Address +',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Open Sans',
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        provider.getByUsername(provider.currentUser).locations.isEmpty
            ? Column(
                children: <Widget>[
                  Image.asset(
                    './assets/images/nohome3.gif',
                    height: 325,
                  ),
                  const Text(
                    "You don't have addresses added.",
                    style: TextStyle(
                      color: Colors.black38,
                      fontFamily: 'Open Sans',
                      fontSize: 15,
                    ),
                  )
                ],
              )
            //addressBoxes
            : Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return AddressBox(
                      location: provider
                          .getByUsername(provider.currentUser)
                          .locations[index],
                      index: index,
                      color: index ==
                              provider
                                      .getByUsername(provider.currentUser)
                                      .locations
                                      .length -
                                  1
                          ? Colors.white
                          : Colors.black38,
                    );
                  },
                  itemCount: provider
                      .getByUsername(provider.currentUser)
                      .locations
                      .length,
                ),
              ),
      ],
    );
  }
}
