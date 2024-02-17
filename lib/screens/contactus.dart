//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// ignore: use_key_in_widget_constructors
class ContactUs extends StatefulWidget {
  static const routeName = './contactus.dart';

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String email = '', img = '';
  bool empty = false, done = false;
  final shakeKey = GlobalKey<ShakeWidgetState>();
  @override
  void initState() {
    img = '';
    super.initState();
  }

  void _callNumber() async {
    const number = '03 85919271';
    // ignore: unused_local_variable
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      backgroundColor: Colors.white,
      body: done
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 150),
                  Text(
                    'Thank you for your feedback!',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                      fontFamily: 'Freehand',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We recieved your email and will reply soon.',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Image.asset(img),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  const SizedBox(height: 25),
                  Text(
                    "We'd like to hear from you",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 26,
                      fontFamily: 'Freehand',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your feedback is important to us, get in touch and let us know what you think.",
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontFamily: 'iosReg',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 350,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: !empty ? Colors.black12 : Colors.red[200]!,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: Colors.white,
                    ),
                    child: Scrollbar(
                      child: TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onChanged: (value) => setState(
                          () {
                            value.isEmpty ? empty = true : empty = false;
                            email = value;
                          },
                        ),
                        maxLines: 100,
                        cursorColor: Theme.of(context).primaryColor,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () => setState(
                      () {
                        if (email.isEmpty) {
                          empty = true;
                          HapticFeedback.heavyImpact();
                          shakeKey.currentState?.shake();
                        } else {
                          done = true;
                          img = './assets/images/email.gif';
                          final player = AudioPlayer();
                          player.play(
                            AssetSource('/sounds/emailsent.mp3'),
                          );
                        }
                      },
                    ),
                    child: Container(
                      height: 47,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ShakeMe(
                        key: shakeKey,
                        shakeCount: 3,
                        shakeOffset: 5,
                        shakeDuration: const Duration(milliseconds: 350),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'SEND EMAIL',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Baby',
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.send,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 22,
                        fontFamily: 'iosReg',
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  GestureDetector(
                    onTap: () => _callNumber(),
                    child: Container(
                      height: 47,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'CALL US',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Baby',
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
