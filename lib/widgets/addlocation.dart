//packages
import 'package:babyshop_app/providers/bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:geocoding/geocoding.dart';
// ignore: depend_on_referenced_packages
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/statepopup.dart';

// ignore: use_key_in_widget_constructors
class AddLocation extends StatefulWidget {
  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
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

  String location = 'Null, Press Button';
  // ignore: non_constant_identifier_names
  String Address = 'Searching...';
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _getAddressFromLatLong(
      Position position, AccountsProvider provider) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    provider.detectLocation(place);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    final bottom = Provider.of<BottomAppBarProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        border: Border(
          top: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      padding: const EdgeInsets.only(bottom: 40, top: 15),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              Position position = await _getGeoLocationPosition();
              location =
                  'Lat: ${position.latitude} , Long: ${position.longitude}';
              _getAddressFromLatLong(position, provider);
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 25),
                Icon(
                  Icons.gps_fixed_outlined,
                  color: Colors.black87,
                ),
                SizedBox(width: 20),
                //detials
                Text(
                  'Detect Current Location',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.5,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 500,
            child: Divider(
              color: Colors.black26,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              provider.updateBody(6);
              bottom.updateBody(3);
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  reset(provider);
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
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 15),
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
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 15),
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
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 15),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                            border: Border.all(
                                                color: Colors.black12)),
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
                                          cursorColor:
                                              Theme.of(context).primaryColor,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          border:
                                              Border.all(color: Colors.black12),
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
                                          cursorColor:
                                              Theme.of(context).primaryColor,
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
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 15),
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
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 15),
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
                                                .getByUsername(
                                                    provider.currentUser)
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
                                    shakeDuration:
                                        const Duration(milliseconds: 350),
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
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                SizedBox(width: 25),
                Icon(
                  Icons.add,
                  color: Colors.black87,
                ),
                SizedBox(width: 20),
                Text(
                  'Add New Location',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
