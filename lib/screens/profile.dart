//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/providers/accounts.dart';

//widgets
import '/widgets/orders.dart';
import '/widgets/babies.dart';
import '/widgets/address.dart';
import '/widgets/payments.dart';
import '/widgets/favorites.dart';
import '/widgets/profilegrid.dart';
import '/widgets/transactions.dart';
import '/widgets/currentrented.dart';

// ignore: use_key_in_widget_constructors
class ProfileScreen extends StatelessWidget {
  static const routeName = './profile.dart';
  final body = [
    const Favorites(),
    ManageBabies(),
    CurrentRented(),
    const Orders(),
    Transactions(),
    CardView(),
    ManageAddress(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              //bg-image
              SizedBox(
                height: 160,
                width: 390,
                child: Opacity(
                  opacity: 0.35,
                  child: Image.asset(
                    './assets/images/babydoodle.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              //details
              Row(
                children: <Widget>[
                  //image
                  Container(
                    margin: const EdgeInsets.only(left: 25, top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        child: SizedBox(
                          width: 110,
                          height: 110,
                          child: Image.asset(
                            provider.getByUsername(provider.currentUser).avatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  //detials
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 15),
                      Text(
                        '${provider.getByUsername(provider.currentUser).firstName} ${provider.getByUsername(provider.currentUser).lastName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 225,
                        child: FittedBox(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                                size: 18,
                              ),
                              const SizedBox(width: 7),
                              Text(
                                provider
                                    .getByUsername(provider.currentUser)
                                    .email,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontFamily: 'Open Sans',
                                ),
                              ),
                              const SizedBox(width: 30),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 190,
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              color: Theme.of(context).primaryColor,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              provider
                                  .getByUsername(provider.currentUser)
                                  .phoneNo,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              provider.getByUsername(provider.currentUser).isPrem
                  ? Positioned(
                      left: 115,
                      top: 23,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color.fromARGB(234, 255, 214, 64),
                              Color.fromARGB(228, 255, 235, 59),
                              Color.fromARGB(234, 255, 193, 7),
                              Color.fromARGB(237, 255, 214, 64),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.crown,
                            color: Color.fromARGB(86, 0, 0, 0),
                            size: 8,
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          const Divider(
            color: Colors.black12,
            height: 0,
          ),
          const SizedBox(height: 10),
          //optionsBar
          Container(
            color: Colors.white,
            width: 360,
            height: 30,
            child: ProfileGrid(),
          ),
          //body
          Container(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            color: Colors.white,
            height: 459,
            child: Consumer<AccountsProvider>(
              builder: (context, screen, _) => body[screen.index],
            ),
          ),
        ],
      ),
    );
  }
}
