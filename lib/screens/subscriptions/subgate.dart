//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

//providers
import '/providers/accounts.dart';
import '/providers/subscriptions.dart';

//screens
import '/screens/subscriptions/subtoy.dart';
import '/screens/subscriptions/submother.dart';

//widgets
import '/widgets/subpack.dart';

class SubscriptionHome extends StatelessWidget {
  static const routeName = './subsgate.dart';

  const SubscriptionHome({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AccountsProvider>(context);
    final provider = Provider.of<SubscriptionProvider>(context);
    var bp = const AssetImage(
      './assets/images/abs4.gif',
    );
    var bpimg = Image(
      height: 315,
      width: double.infinity,
      image: bp,
      fit: BoxFit.cover,
    );
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          //dynamic
          Stack(
            children: <Widget>[
              bpimg,
              Positioned(
                bottom: -25,
                left: -25,
                child: Container(
                  width: 500,
                  height: 85,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 100,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 15,
                child: Image.asset(
                  './assets/images/prem.png',
                  width: 100,
                ),
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  "Unlock unlimited features for\nyour baby's future.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Open Sans',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          //currentPlan
          StatefulBuilder(
            builder: (context, setState) => Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white10,
              ),
              width: 335,
              height: 65,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 25),
                  user.currentPlan == ''
                      ? const Text(
                          'Tetina Free',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 12),
                            Text(
                              user.currentPackage,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 2.5),
                            Text(
                              user.currentPlan,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontFamily: 'Open Sans',
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                  const SizedBox(width: 115),
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'CURRENT PLAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          //choosePlan txt
          const Row(
            children: <Widget>[
              SizedBox(width: 20),
              Text(
                'Choose your plan',
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'Open Sans',
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          //box1
          GestureDetector(
            onTap: () {
              provider.setPage(1);
              Navigator.pushNamed(context, SubMother.routeName);
            },
            child: SubPack(
              title: "Mother's\nBox Of Love",
              txt: 'Enjoy our monthly box of love.',
              img: './assets/images/gift.jpeg',
              boxColour: Colors.white10,
              titleColour: Colors.indigo[400]!,
              subColour: Colors.indigo[300]!,
              buttonColour: Colors.indigo[300]!,
              dividerColour: Colors.white,
              left: true,
            ),
          ),

          const SizedBox(height: 20),

          //box2
          GestureDetector(
            onTap: () {
              provider.setPage(2);
              Navigator.pushNamed(context, SubToy.routeName);
            },
            child: SubPack(
              title: "Baby's\nBox Of Joy",
              txt: 'Enjoy our monthly box of joy.',
              img: './assets/images/toya.jpeg',
              boxColour: Colors.white10,
              titleColour: Colors.brown,
              subColour: Colors.brown[100]!,
              buttonColour: Colors.brown[300]!,
              dividerColour: Colors.white,
              left: false,
            ),
          ),

          const SizedBox(height: 15),
          const Text(
            'You can cancel your subcription anytime via the app.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
