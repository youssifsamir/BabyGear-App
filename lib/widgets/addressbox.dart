//packages
import 'package:babyshop_app/widgets/statepopup.dart';
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
class AddressBox extends StatefulWidget {
  Location location;
  final int index;
  final Color color;
  // ignore: use_key_in_widget_constructors
  AddressBox(
      {required this.location, required this.index, required this.color});

  @override
  State<AddressBox> createState() => _AddressBoxState();
}

class _AddressBoxState extends State<AddressBox> {
  String state = '',
      city = '',
      street = '',
      building = '',
      floor = '',
      apartment = '',
      landmark = '',
      description = '',
      country = '';

  bool txt = false;

  final shakeKey = GlobalKey<ShakeWidgetState>();

  void reset() {
    txt = false;
    state = widget.location.state;
    city = widget.location.city;
    street = widget.location.street;
    building = widget.location.building;
    floor = widget.location.floor;
    apartment = widget.location.apartment;
    landmark = widget.location.landmark;
    description = widget.location.description;
    country = widget.location.country;
  }

  void edit(BuildContext context, AccountsProvider provider) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        reset();
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
                  'Edit ${widget.location.description}',
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
              height: 650,
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
                    child: StatePopUp(selected: widget.location.state),
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
                        decoration: InputDecoration(
                          hintText: widget.location.city,
                          hintStyle: const TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
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
                        decoration: InputDecoration(
                          hintText: widget.location.street,
                          hintStyle: const TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //building
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
                        decoration: InputDecoration(
                          hintText: widget.location.street,
                          hintStyle: const TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  //building/floor/apartment
                  StatefulBuilder(
                    builder: (context, setState) => Row(
                      children: <Widget>[
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
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: widget.location.floor,
                                  hintStyle: const TextStyle(
                                    fontFamily: 'iosReg',
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 11.5,
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
                                  () => apartment = value.toString(),
                                ),
                                maxLines: 1,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: widget.location.apartment,
                                  hintStyle: const TextStyle(
                                    fontFamily: 'iosReg',
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 11.5,
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
                        decoration: InputDecoration(
                          hintText: widget.location.landmark,
                          hintStyle: const TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
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
                        decoration: InputDecoration(
                          hintText: widget.location.description,
                          hintStyle: const TextStyle(
                            fontFamily: 'iosReg',
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 10, bottom: 15),
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
                          if (state.trim() != '' &&
                              city.trim() != '' &&
                              building.trim() != '' &&
                              landmark.trim() != '' &&
                              apartment.trim() != '' &&
                              floor.trim() != '' &&
                              street.trim() != '' &&
                              description.trim() != '' &&
                              country.trim() != '') {
                            provider.editAddress(
                              widget.location.id,
                              state.trim(),
                              city.trim(),
                              street.trim(),
                              building.trim(),
                              floor.trim(),
                              apartment.trim(),
                              landmark.trim(),
                              description.trim(),
                              country,
                            );
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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: widget.color,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          //details
          SizedBox(
            width: 340,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //description
                Row(
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.mapPin,
                      size: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Address ${widget.index + 1} - ${widget.location.description}',
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                //city&state
                Row(
                  children: <Widget>[
                    const Text(
                      'State:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      widget.location.state,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'City:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      widget.location.city,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //street
                Row(
                  children: <Widget>[
                    const Text(
                      'Street:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.location.street,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //building, floor & apartment
                FittedBox(
                  child: Row(
                    children: <Widget>[
                      const Text(
                        'Building:',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.location.building,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Floor:',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.location.floor,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Apartment:',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.location.apartment,
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                //landmark
                Row(
                  children: <Widget>[
                    const Text(
                      'Landmark:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.location.landmark,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                //buttons
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        user.setSelected(widget.location.state);
                        edit(context, user);
                      },
                      child: Container(
                        width: 165,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(2, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Open Sans',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Icon(
                              Icons.edit,
                              color: Theme.of(context).primaryColor,
                              size: 19,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => user.deleteAddress(widget.location),
                      child: Container(
                        width: 165,
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(2, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6),
                          ),
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Remove',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Open Sans',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 7),
                            Icon(
                              Icons.delete,
                              color: Theme.of(context).primaryColor,
                              size: 19,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ],
            ),
          )
        ],
      ),
    );
  }
}
