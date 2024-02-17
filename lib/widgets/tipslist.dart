//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/tips.dart';
import '/providers/accounts.dart';

//screens
import '/screens/tips/tipsdetials.dart';
import '/screens/subscriptions/subgate.dart';

//widgets
import 'tipstile.dart';

class TipsList extends StatelessWidget {
  static const routeName = '/tipstiles.dart';

  const TipsList({super.key});

  void showPrem(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black87,
          insetPadding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Image.asset(
            './assets/images/prem.png',
            height: 50,
            // width: 100,
          ),
          content: SizedBox(
            height: 115,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  '      Premiuem tips are locked.\nSubscribe now to unlock all tips.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'iosReg',
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //noButton
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 132.5,
                        height: 33.5,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(
                                2,
                                10,
                              ),
                            ),
                          ],
                          border: Border.all(
                            width: 1.5,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: const Color.fromARGB(225, 255, 255, 255),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'iosReg',
                              color: Color.fromARGB(255, 116, 90, 37),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    // yesButton
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(
                          context,
                          SubscriptionHome.routeName,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 132.5,
                        height: 33.5,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(2, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Color.fromARGB(255, 123, 92, 28),
                        ),
                        child: const Center(
                          child: Text(
                            'Subsribe',
                            style: TextStyle(
                              fontFamily: 'iosReg',
                              color: Colors.white,
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TipsProvider>(context);
    final user = Provider.of<AccountsProvider>(context);
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return provider.getCategory() == 'All'
              ? GestureDetector(
                  onTap: () {
                    provider.Tips[index].isPrem
                        ? user.getByUsername(user.currentUser).isPrem
                            ? Navigator.pushNamed(
                                context,
                                TipsDetails.routeName,
                                arguments: provider.Tips[index],
                              )
                            : showPrem(context)
                        : Navigator.pushNamed(
                            context,
                            TipsDetails.routeName,
                            arguments: provider.Tips[index],
                          );
                  },
                  child: TipsTile(
                    title: provider.Tips[index].title,
                    image: provider.Tips[index].image,
                    vis: provider.Tips[index].isPrem ? true : false,
                    text: provider.Tips[index].text,
                    icon: provider.Tips[index].icon,
                  ),
                )
              : provider.Tips[index].category == provider.getCategory()
                  ? GestureDetector(
                      onTap: () {
                        provider.Tips[index].isPrem
                            ? user.getByUsername(user.currentUser).isPrem
                                ? Navigator.pushNamed(
                                    context,
                                    TipsDetails.routeName,
                                    arguments: provider.Tips[index],
                                  )
                                : showPrem(context)
                            : Navigator.pushNamed(
                                context,
                                TipsDetails.routeName,
                                arguments: provider.Tips[index],
                              );
                      },
                      child: TipsTile(
                        title: provider.Tips[index].title,
                        image: provider.Tips[index].image,
                        vis: provider.Tips[index].isPrem ? true : false,
                        text: provider.Tips[index].text,
                        icon: provider.Tips[index].icon,
                      ),
                    )
                  : Container();
        },
        itemCount: provider.Tips.length,
      ),
    );
  }
}
