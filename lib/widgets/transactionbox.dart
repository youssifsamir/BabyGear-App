//packages
import 'package:flutter/material.dart';

//providers
import '/providers/accounts.dart';

class TransactionBox extends StatelessWidget {
  final History transaction;
  final Color color;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  TransactionBox({required this.transaction, required this.color});
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
                      transaction.quantity,
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
                const SizedBox(height: 4),
                //total
                Text(
                  'Total: ${transaction.total}',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                //view
                Container(
                  height: 33,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(41, 0, 0, 0),
                        blurRadius: 4,
                        offset: Offset(0, 7), // Shadow position
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'View Details',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.library_books_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 16,
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
