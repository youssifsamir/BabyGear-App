//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

class LocationBox extends StatefulWidget {
  final Location location;
  final bool last;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  LocationBox({required this.location, required this.last});

  @override
  State<LocationBox> createState() => _LocationBoxState();
}

class _LocationBoxState extends State<LocationBox> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);

    return GestureDetector(
      onTap: () {
        provider.changeLocation(widget.location);
        Navigator.pop(context);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: widget.last
                  ? Colors.white
                  : const Color.fromARGB(13, 0, 0, 0),
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
              child: Icon(
                Icons.location_on_outlined,
                color: Color.fromARGB(150, 0, 0, 0),
                size: 30,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${widget.location.country}, ${widget.location.state}',
                  style: const TextStyle(
                    color: Color.fromARGB(180, 0, 0, 0),
                    fontSize: 17,
                    fontFamily: 'Open Sans',
                  ),
                ),
                const SizedBox(height: 7.5),
                Text(
                  '${widget.location.city}, ${widget.location.street}',
                  style: const TextStyle(
                    color: Color.fromARGB(90, 0, 0, 0),
                    fontSize: 15,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
