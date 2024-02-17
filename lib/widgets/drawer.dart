//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//screens
import '/screens/settings.dart';
import '/screens/contactus.dart';
import '/screens/subscriptions/subgate.dart';

//providers
import '/providers/tips.dart';
import '/providers/accounts.dart';
import '/providers/bottomappbar.dart';

// ignore: use_key_in_widget_constructors
class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      String title, IconData icons, BuildContext ctx, VoidCallback tapHandler) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        leading: Icon(
          icons,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontFamily: 'Baby',
          ),
        ),
        onTap: tapHandler,
        splashColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final account = Provider.of<AccountsProvider>(context);
    final bottombar = Provider.of<BottomAppBarProvider>(context);
    final tips = Provider.of<TipsProvider>(context);
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                color: const Color.fromRGBO(229, 190, 170, 0.7),
                width: double.infinity,
                height: 340,
                child: Column(
                  children: [
                    const SizedBox(height: 87.5),
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Container(
                            height: 162,
                            width: 162,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: 6,
                          left: 6,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: const BoxDecoration(),
                              child: SizedBox(
                                child: Image.asset(
                                  account
                                      .getByUsername(account.currentUser)
                                      .avatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: 150,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                      ),
                      child: FittedBox(
                        child: Text(
                          '${account.getByUsername(account.currentUser).firstName} ${account.getByUsername(account.currentUser).lastName}',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Baby',
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 504,
                color: const Color.fromARGB(205, 28, 145, 141),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildListTile(
                      'Subscriptions',
                      Icons.star_rounded,
                      context,
                      () {
                        Navigator.of(context).pushNamed(
                          SubscriptionHome.routeName,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 220,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    buildListTile(
                      'Contact Us',
                      Icons.mark_as_unread_sharp,
                      context,
                      () {
                        Navigator.pushNamed(
                          context,
                          ContactUs.routeName,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 220,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    buildListTile(
                      'Settings',
                      Icons.settings,
                      context,
                      () {
                        Navigator.pushNamed(
                          context,
                          SettingsScreen.routeName,
                        );
                      },
                    ),
                    const SizedBox(
                      width: 220,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 34),
                      child: GestureDetector(
                        onTap: () {
                          bottombar.resetIndex();
                          tips.resetIndex();
                          account.resetIndex();
                          Navigator.of(context).pop();
                          Navigator.of(context).popAndPushNamed('/');
                        },
                        child: const Row(
                          children: <Widget>[
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 37,
                                fontFamily: 'Baby',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // -- Divider ----
          Positioned(
            top: 325,
            right: -10,
            child: SizedBox(
              width: 320,
              child: Image.asset(
                './assets/images/divider.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
