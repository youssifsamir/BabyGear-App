//packages
import 'package:flutter/material.dart';

//providers
import '/providers/accounts.dart';

class RentedBox extends StatelessWidget {
  final Rents rents;
  final Color color;
  RentedBox({required this.rents, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          //image
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 20, right: 20),
            width: 175,
            height: 175,
            child: Image.asset(
              rents.image,
            ),
          ),
          //details
          SizedBox(
            width: 175,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //prodName
                Text(
                  rents.prodname,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                  ),
                ),
                const SizedBox(height: 8),
                //brand
                Row(
                  children: <Widget>[
                    const Text(
                      'Brand:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rents.brand,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //color
                Row(
                  children: <Widget>[
                    const Text(
                      'Color:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rents.color,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //quantity
                Row(
                  children: <Widget>[
                    const Text(
                      'Quantity:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      rents.quantity,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //rentDuration
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Text(
                          'Rent Duration:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          rents.rentDuration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${rents.rentedOn} - ${rents.rentedOff}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                //daysLeft
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${int.parse(rents.rentedOff.substring(rents.rentedOff.length - 4, rents.rentedOff.length - 2)) - (int.parse(rents.rentedOn.substring(rents.rentedOn.length - 4, rents.rentedOn.length - 2))) - 3} days left',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Open Sans',
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(
                        Icons.timelapse_sharp,
                        color: Theme.of(context).primaryColor,
                        size: 19,
                      )
                    ],
                  ),
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
