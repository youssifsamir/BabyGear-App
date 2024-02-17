//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:blurrycontainer/blurrycontainer.dart';
// ignore: depend_on_referenced_packages
import 'package:easy_localization/easy_localization.dart';

//providers
import '/providers/accounts.dart';
import '/providers/subscriptions.dart';

//widgets
import '/widgets/subads.dart';
import '/widgets/subfilter.dart';
import '/widgets/offerview.dart';
import '/widgets/circle_bar.dart';

class FingerPrintIcon extends StatelessWidget {
  final double value;
  const FingerPrintIcon({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        const Center(
          child: Icon(
            Icons.fingerprint,
            color: Colors.blue,
            size: 45,
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRect(
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: value,
              child: Icon(
                Icons.fingerprint,
                color: Colors.blue[900],
                size: 45,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: use_key_in_widget_constructors
class SubMother extends StatefulWidget {
  static const routeName = './submother.dart';

  @override
  State<SubMother> createState() => _SubMotherState();
}

class _SubMotherState extends State<SubMother>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool showFingerPrint = false;
  bool isAnimationCompleted = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
  }

  _onLongPressStart(LongPressStartDetails details) {
    if (!_controller.isAnimating) {
      _controller.forward();
    } else {
      _controller.forward(from: _controller.value);
    }
  }

  _onLongPressEnd(LongPressEndDetails details) {
    _controller.reverse();
  }

  void paymentSheet(SubscriptionProvider provider, AccountsProvider user) {
    showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => BlurryContainer(
            height: 590,
            blur: 20,
            borderRadius: const BorderRadius.all(
              Radius.circular(0),
            ),
            color: const Color.fromARGB(150, 60, 60, 60),
            child:
                // ? Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       Image.asset(
                //         './assets/images/pay.gif',
                //         height: 150,
                //         width: 150,
                //         // fit: BoxFit.cover,
                //       ),
                //       const SizedBox(height: 20),
                //       const Text(
                //         'Payment Successful',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontFamily: 'iosReg',
                //           fontSize: 22,
                //         ),
                //       )
                //     ],
                //   )
                Column(
              children: <Widget>[
                const SizedBox(height: 5),
                //header
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10),
                    const Text(
                      'App Store',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ios',
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(width: 224),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontFamily: 'iosReg',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                //section1
                Row(
                  children: <Widget>[
                    const SizedBox(width: 40),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12.5),
                      ),
                      child: Image.asset(
                        './assets/images/applogo.png',
                        fit: BoxFit.cover,
                        height: 60,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${provider.getPackage()} ${provider.plans[provider.selected]}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'iosReg',
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2.5),
                        const Text(
                          "Mother's Box of Love\nSubscription",
                          style: TextStyle(
                            color: Colors.white38,
                            fontFamily: 'iosReg',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //divider
                const SizedBox(
                  width: 350,
                  height: 40,
                  child: Divider(
                    color: Colors.white24,
                  ),
                ),

                //section2
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(width: 58),
                    Text(
                      'POLICY',
                      style: TextStyle(
                        color: Colors.white38,
                        fontFamily: 'iosReg',
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox(
                      width: 250,
                      child: Text(
                        'Cancel at any time in Settings > Apple ID at least one day before each renewal date.\nPlan automatically renews until cancelled.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'iosReg',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                //divider
                const SizedBox(
                  width: 350,
                  height: 40,
                  child: Divider(
                    color: Colors.white24,
                  ),
                ),

                //section3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 31),
                    const Text(
                      'ACCOUNT',
                      style: TextStyle(
                        color: Colors.white38,
                        fontFamily: 'iosReg',
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 14.5),
                    Text(
                      user.getByUsername(user.currentUser).email,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'iosReg',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                //divider
                const SizedBox(
                  width: 350,
                  height: 40,
                  child: Divider(
                    color: Colors.white24,
                  ),
                ),

                //section3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(width: 63.5),
                    const Text(
                      'PRICE',
                      style: TextStyle(
                        color: Colors.white38,
                        fontFamily: 'iosReg',
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 14.5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Starting on  ${DateFormat.yMMMMd().format(DateTime.now())}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'iosReg',
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${provider.getPrices()} per ${provider.plans[provider.selected].substring(0, 9)}',
                          style: const TextStyle(
                            wordSpacing: 1.5,
                            color: Colors.white,
                            fontFamily: 'iosReg',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //divider
                const SizedBox(
                  width: 350,
                  height: 40,
                  child: Divider(
                    color: Colors.white24,
                  ),
                ),

                GestureDetector(
                  onLongPressStart: (details) async {
                    HapticFeedback.mediumImpact();
                    _onLongPressStart(details);
                  },
                  onLongPressEnd: (details) => _onLongPressEnd(details),
                  child: Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Transform.scale(
                            scale: ((_controller.value * 0.2) + 1),
                            child: Container(
                              width: 65,
                              padding: const EdgeInsets.all(10),
                              height: 65,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  CircularProgres(value: _controller.value),
                                  SizedBox(
                                    child: FingerPrintIcon(
                                      value: _controller.value,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Hold to confirm',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'iosReg',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
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
    final provider = Provider.of<SubscriptionProvider>(context);
    final user = Provider.of<AccountsProvider>(context);

    var bp = const AssetImage(
      './assets/images/abs4.gif',
    );
    var bpimg = Image(
      height: 110,
      width: double.infinity,
      image: bp,
      fit: BoxFit.cover,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        toolbarOpacity: 1,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.black,
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
                top: 68.5,
                child: Row(
                  children: <Widget>[
                    const SizedBox(width: 38),
                    Image.asset(
                      './assets/images/logo22.png',
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                    Image.asset(
                      './assets/images/prem.png',
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 500,
            height: 150,
            child: const SubAds(),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 300,
            child: Divider(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Mother's Box of Love",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Open Sans',
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 15),
          SubFilter(),
          const SizedBox(height: 15),
          SizedBox(
            height: 20,
            child: Text(
              provider.getType() == 0
                  ? 'For mothers that are pregnant between 1-6 months.'
                  : 'For mothers in labor between 3-12 months.',
              style: const TextStyle(
                color: Colors.white54,
                fontFamily: 'Open Sans',
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 265,
            width: 350,
            child: OffersView(),
          ),
          const SizedBox(height: 22.5),
          GestureDetector(
            onTap: () => paymentSheet(provider, user),
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.indigo[300],
              ),
              child: const Center(
                child: Text(
                  'Subscribe now',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Terms & Conditions Applied.',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 14,
              fontFamily: 'Open Sans',
            ),
          ),
        ],
      ),
    );
  }
}
