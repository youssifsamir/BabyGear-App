//package
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/tabs.dart';

//widgets
import '/widgets/creditCard.dart';

// ignore: use_key_in_widget_constructors
class AddCreditCard extends StatefulWidget {
  static const routeName = './addCreditCard.dart';

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
  String name = '', num = '', expdate = '/', cvv = '';

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        title: Text(
          'Add Credit Card',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Freehand',
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(45, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: CreditCardWidget(
                  name: name,
                  number: num,
                  expiryDate: expdate,
                  cvv: cvv,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 45),
                child: Text(
                  'Card Number',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r"[0-9.]",
                        ),
                      ),
                    ],
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        num = value;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Text(
                  'Expiry Date',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r"[0-9/]",
                        ),
                      ),
                    ],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        expdate = value;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Text(
                  'CVV',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r"[0-9.]",
                        ),
                      ),
                    ],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 20),
                child: Text(
                  'Card Holder Name',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Open Sans',
                    color: Colors.black38,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 3),
                  child: TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          r"[a-zA-Z]",
                        ),
                      ),
                    ],
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: const InputDecoration(border: InputBorder.none),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      user.addCreditCard(
                        CreditCard(
                          number: num,
                          name: name,
                          expiryDate: expdate,
                          cvv: cvv,
                        ),
                      );
                      Navigator.of(context)
                          .popAndPushNamed(TabScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1.5,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(45, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(0, 15),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Add Card',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Open Sans',
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            './assets/images/addcard.png',
                            width: 55,
                            height: 55,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
