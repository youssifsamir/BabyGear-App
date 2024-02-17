//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:dotted_line/dotted_line.dart';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//provider
import '/providers/form.dart';
import '/providers/accounts.dart';

//screens
import '../tabs.dart';
import '../market/marketproduct.dart';
import '../market/marketdetails.dart';

//widgets
import '/widgets/imageuploader.dart';

// ignore: use_key_in_widget_constructors
class MarketSubs extends StatelessWidget {
  static const routeName = './marketSubs.dart';

  final List<dynamic> screen = [
    MarketProduct(),
    MarketDetails(),
    ImageUploader(),
  ];

  void showDone(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Image.asset(
            './assets/images/request.gif',
          ),
          content: Container(
            color: Colors.white,
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'We recieved your request!',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontFamily: 'Freehand',
                      fontSize: 26,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Our team will look into it and reply soon.',
                    style: TextStyle(
                      color: Colors.black26,
                      fontFamily: 'iosReg',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      ),
                    ),
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
    var wallpaper = const AssetImage(
      './assets/images/babydoodle.png',
    );

    var wallimage = Image(
      height: double.infinity,
      image: wallpaper,
      fit: BoxFit.cover,
    );

    final provider = Provider.of<FormProvider>(context);
    final user = Provider.of<AccountsProvider>(context);
    final Color on = Theme.of(context).primaryColor,
        off = const Color.fromARGB(25, 0, 0, 0),
        off2 = const Color.fromARGB(100, 0, 0, 0);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 175,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //backArrow&Title
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    //alertbox
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          insetPadding: const EdgeInsets.all(25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Text(
                            'Are your sure you want to leave?',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'Open Sans',
                              fontSize: 19,
                            ),
                          ),
                          content: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 15,
                            ),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  ' Progress will be unsaved.',
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontFamily: 'Open Sans',
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 15),
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
                                              color:
                                                  Color.fromARGB(41, 0, 0, 0),
                                              blurRadius: 4,
                                              offset: Offset(
                                                2,
                                                10,
                                              ),
                                            ),
                                          ],
                                          border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'No',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    // yesButton
                                    GestureDetector(
                                      onTap: () {
                                        provider.reset();
                                        Navigator.pop(context);
                                        Navigator.popAndPushNamed(
                                          context,
                                          TabScreen.routeName,
                                          arguments: user.currentUser,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        width: 132.5,
                                        height: 33.5,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color:
                                                  Color.fromARGB(41, 0, 0, 0),
                                              blurRadius: 4,
                                              offset: Offset(2, 10),
                                            ),
                                          ],
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Yes',
                                            style: TextStyle(
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
                  },
                  //backarrow
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                ),
                //title
                Container(
                  padding: const EdgeInsets.only(bottom: 3),
                  width: 330,
                  child: Center(
                    child: Text(
                      provider.title[provider.subScreen],
                      style: TextStyle(
                        color: on,
                        fontFamily: 'Open Sans',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            //progressbar
            Row(
              children: <Widget>[
                const SizedBox(width: 10),
                Column(
                  children: <Widget>[
                    AnimatedContainer(
                      width: 40,
                      height: 40,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: on,
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.tags,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ' Product',
                      style: TextStyle(
                        color: on,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 105,
                  height: 15,
                  child: DottedLine(
                    dashLength: 5,
                    dashGapLength: 2,
                    dashColor: provider.subScreen > 0 ? off2 : off,
                  ),
                ),
                const SizedBox(width: 2),
                Column(
                  children: <Widget>[
                    AnimatedContainer(
                      width: provider.subScreen > 0 ? 40 : 33,
                      height: provider.subScreen > 0 ? 40 : 33,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: provider.subScreen > 0 ? on : off,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.pencil,
                          color: provider.subScreen > 0 ? Colors.white : off,
                          size: provider.subScreen > 0 ? 20 : 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ' Details',
                      style: TextStyle(
                        color: provider.subScreen > 0 ? on : off,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 3),
                SizedBox(
                  width: 105,
                  height: 15,
                  child: DottedLine(
                    dashLength: 5,
                    dashGapLength: 2,
                    dashColor: provider.subScreen > 1 ? off2 : off,
                  ),
                ),
                const SizedBox(width: 4),
                Column(
                  children: <Widget>[
                    AnimatedContainer(
                      width: provider.subScreen > 1 ? 40 : 33,
                      height: provider.subScreen > 1 ? 40 : 33,
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                        color: provider.subScreen > 1 ? on : off,
                      ),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.image,
                          color: provider.subScreen > 1 ? Colors.white : off,
                          size: provider.subScreen > 1 ? 20 : 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      ' Image',
                      style: TextStyle(
                        color: provider.subScreen > 1 ? on : off,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: 400,
        height: 100,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => provider.setScreen(provider.subScreen - 1),
              child: AnimatedContainer(
                margin: const EdgeInsets.only(right: 10, bottom: 40),
                duration: const Duration(milliseconds: 850),
                curve: Curves.easeInOutCubicEmphasized,
                width: provider.subScreen != 0 ? 170 : 0,
                height: 50,
                decoration: BoxDecoration(
                  color: on,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(2, 10),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: provider.subScreen != 0 ? 20 : 0,
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: const Text('BACK'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (provider.subScreen == 2 && provider.allow()) {
                  Navigator.popAndPushNamed(context, TabScreen.routeName);
                  showDone(context);
                  provider.reset();
                  final player = AudioPlayer();
                  player.play(
                    AssetSource('/sounds/received.mp3'),
                  );
                }
                provider.allow()
                    ? provider.setScreen(provider.subScreen + 1)
                    : {};
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(bottom: 40),
                duration: const Duration(milliseconds: 750),
                curve: Curves.easeInOutCubicEmphasized,
                width: provider.subScreen == 0 ? 350 : 170,
                height: 50,
                decoration: BoxDecoration(
                  color: provider.allow() ? on : Colors.teal[200],
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(41, 0, 0, 0),
                      blurRadius: 4,
                      offset: Offset(2, 10),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    provider.subScreen == 2 ? 'SUBMIT' : 'NEXT',
                    style: TextStyle(
                      fontSize: 20,
                      color: provider.allow() ? Colors.white : Colors.white38,
                      fontFamily: 'Open Sans',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Opacity(
            opacity: 0.2,
            child: wallimage,
          ),
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              height: 460,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: screen[provider.subScreen],
            ),
          ),
        ],
      ),
    );
  }
}
