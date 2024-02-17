//packages
import 'dart:async';
import 'package:flutter/material.dart';

//screens
import '/screens/login.dart';
import 'signupp/signup.dart';

// ignore: use_key_in_widget_constructors
class LandingScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LandingScreen createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  bool _visible = false;

  @override
  void initState() {
    //logoFading
    Timer(const Duration(milliseconds: 650), () {
      setState(() {
        _visible = true;
      });
    });
    //buttons
    Timer(
      const Duration(seconds: 3),
      () {
        showModalBottomSheet(
          enableDrag: false,
          isDismissible: false,
          elevation: 0,
          barrierColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              color: Colors.transparent,
              height: 200,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const SizedBox(width: 7),
                        //login button
                        GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(LoginScreen.routeName),
                          child: Container(
                            height: 55,
                            width: 345,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(70, 150, 151, 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(41, 0, 0, 0),
                                  blurRadius: 4,
                                  offset: Offset(2, 10),
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              // border: Border.all(
                              //   color: Colors.white,
                              //   width: 2.5,
                              // ),
                            ),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Baby',
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        //signup button
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            SignupScreen.routeName,
                          ),
                          child: Container(
                            height: 55,
                            width: 345,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(41, 0, 0, 0),
                                  blurRadius: 4,
                                  offset: Offset(2, 10), // Shadow position
                                ),
                              ],
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18,
                                  fontFamily: 'Baby',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 55,
                    right: 5,
                    child: SizedBox(
                      width: 130,
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            './assets/images/baby.gif',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = const AssetImage('./assets/images/logo.png');
    var image = Image(
      image: assetsImage,
      width: 350,
    );

    var wallpaper = const AssetImage(
      './assets/images/babydoodle.png',
    );
    var wallimage = Image(
      height: double.infinity,
      image: wallpaper,
      fit: BoxFit.cover,
    );

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.15,
              child: wallimage,
            ),
            Positioned(
              left: 20,
              top: 335,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeIn,
                opacity: _visible ? 1 : 0,
                child: image,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
