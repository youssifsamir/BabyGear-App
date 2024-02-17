//packages
import 'package:flutter/material.dart';

//providers
import '/providers/accounts.dart';

class OrdersBox extends StatelessWidget {
  final Transaction transaction;
  final Color color;
  OrdersBox({required this.transaction, required this.color});
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
              transaction.image,
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
                  transaction.prodname,
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
                      transaction.brand,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //color&quantity
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
                      transaction.color,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Quantity:',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      transaction.quantity,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //orderedOn
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Ordered on:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      Text(
                        transaction.date,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                //deliveryOn
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Estimated Arrival:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      Text(
                        transaction.dDate,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                //deliveredTo
                FittedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Delivery to:',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      Text(
                        transaction.location,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                //status
                Row(
                  children: <Widget>[
                    const Text(
                      'Status:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      transaction.status,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //total
                Row(
                  children: <Widget>[
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      transaction.total,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //payment
                Row(
                  children: <Widget>[
                    const Text(
                      'Payment:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      transaction.payment,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                //orderNo
                Row(
                  children: <Widget>[
                    const Text(
                      'Order number:',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      transaction.orderNo,
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                //trackOrder
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(41, 0, 0, 0),
                        blurRadius: 4,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                    color: Colors.amber[400],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Track Order',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(width: 7),
                      Icon(
                        Icons.local_shipping_outlined,
                        color: Colors.black54,
                        size: 20,
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
