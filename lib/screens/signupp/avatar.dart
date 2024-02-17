//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

//widgets
import '/widgets/avataruploader.dart';

// ignore: use_key_in_widget_constructors
class AvatarScreen extends StatefulWidget {
  static const routeName = './avatar.dart';

  @override
  State<AvatarScreen> createState() => _AvatarScreen();
}

class _AvatarScreen extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    var wallpaper = const AssetImage('./assets/images/babydoodle.png');
    var wallimage = Image(
      image: wallpaper,
      fit: BoxFit.cover,
      height: double.infinity,
    );

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
                        'You Are One Step Away!',
                        style: TextStyle(
                          fontSize: 29,
                          fontFamily: 'Freehand',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'Complete your profile and upload a profile picture',
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Open Sans',
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 10),

                      //Divider
                      const SizedBox(
                        width: 250,
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),

                      AvatarUploader(),

                      const SizedBox(height: 550),
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
