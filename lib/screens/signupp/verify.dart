//packages
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_verification_code/flutter_verification_code.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/signupp/avatar.dart';

// ignore: use_key_in_widget_constructors
class VerifyScreen extends StatefulWidget {
  static const routeName = './verify.dart';

  @override
  State<VerifyScreen> createState() => _VerifyScreen();
}

class _VerifyScreen extends State<VerifyScreen> {
  String img = './assets/images/waiting.gif';
  final shakeKey = GlobalKey<ShakeWidgetState>();
  bool _onEditing = true, loading = false, txt = false, done = false;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final account = ModalRoute.of(context)?.settings.arguments as Account;
    final provider = Provider.of<AccountsProvider>(context);

    var wallpaper = const AssetImage('./assets/images/babydoodle.png');
    var wallimage = Image(
      image: wallpaper,
      fit: BoxFit.cover,
      height: double.infinity,
    );

    void resend() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.only(top: 10),
          content: SizedBox(
            height: 37,
            child: Text(
              '                                    Code Resent.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Open Sans',
              ),
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    void validate(String code, AccountsProvider provider) async {
      setState(() {
        txt = false;
        loading = true;
        img = './assets/images/loading.gif';
      });
      Timer(
        const Duration(milliseconds: 1000),
        () {
          if (code == '1234') {
            done = true;
            provider.addAccount(account);
            provider.setCurrentLocation();
            setState(() {
              loading = false;
              img = './assets/images/valid.gif';
            });
            Timer(const Duration(milliseconds: 2850), () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 3);
              Navigator.of(context).popAndPushNamed(AvatarScreen.routeName);
            });
          } else {
            setState(() {
              HapticFeedback.mediumImpact();
              shakeKey.currentState?.shake();
              loading = false;
              txt = true;
              img = './assets/images/waiting.gif';
            });
          }
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Appbar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      //body
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.15,
            child: wallimage,
          ),
          ListView(
            padding: const EdgeInsets.only(bottom: 0, top: 200),
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                ),
                child: Container(
                  width: 390,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      //Login text
                      Text(
                        'We Sent You An Email!',
                        style: TextStyle(
                          fontSize: 29,
                          fontFamily: 'Freehand',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        '                Please check your email and\nenter the verfication code to verify your email.',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 5),

                      //Divider
                      const SizedBox(
                        width: 250,
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),
                      const SizedBox(height: 35),
                      VerificationCode(
                        digitsOnly: true,
                        textStyle:
                            TextStyle(fontSize: 20.0, color: Colors.red[900]),
                        keyboardType: TextInputType.number,
                        underlineColor: Colors.green,
                        length: 4,
                        cursorColor: Colors.blue,
                        clearAll: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              color: done || loading
                                  ? Colors.white
                                  : Colors.blue[700],
                            ),
                          ),
                        ),
                        onCompleted: (String value) {
                          setState(() {
                            validate(value, provider);
                          });
                        },
                        onEditing: (bool value) {
                          setState(() {
                            _onEditing = value;
                          });
                          if (!_onEditing) FocusScope.of(context).unfocus();
                        },
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () => resend(),
                        child: Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 14.0,
                            decoration: TextDecoration.underline,
                            color: done || loading
                                ? Colors.white
                                : Colors.blue[700],
                          ),
                        ),
                      ),
                      SizedBox(height: loading ? 100 : 0),
                      Stack(
                        children: [
                          Image.asset(
                            img,
                            width: loading ? 100 : 400,
                          ),
                          Positioned(
                            bottom: 25,
                            left: 108,
                            child: ShakeMe(
                              key: shakeKey,
                              shakeCount: 300,
                              shakeOffset: 3,
                              shakeDuration: const Duration(milliseconds: 350),
                              child: Text(
                                'Invalid Verfication Code!',
                                style: TextStyle(
                                  color: txt ? Colors.red[900] : Colors.white,
                                  fontFamily: 'Open Sans',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: loading ? 150 : 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
