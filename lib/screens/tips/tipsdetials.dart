//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

//providers
import '/providers/tips.dart';

//widgets
import '/widgets/stepslist.dart';

// ignore: use_key_in_widget_constructors
class TipsDetails extends StatefulWidget {
  static const routeName = './tipsdetails.dart';

  @override
  State<TipsDetails> createState() => _TipsDetailsState();
}

class _TipsDetailsState extends State<TipsDetails> {
  @override
  Widget build(BuildContext context) {
    final tip = ModalRoute.of(context)?.settings.arguments as TipsObj;
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = YoutubePlayerController.fromVideoId(
      videoId: tip.vid,
      autoPlay: true,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
      ),
    );
    var wallpaper = const AssetImage(
      './assets/images/purpheart.png',
    );
    var wallimage = Image(
      height: double.infinity,
      image: wallpaper,
      fit: BoxFit.cover,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 5,
            forceElevated: true,
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            title: FittedBox(
              child: Text(
                tip.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Baby',
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
        body: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.15,
              child: wallimage,
            ),
            ListView(
              padding: const EdgeInsets.only(top: 30),
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                          color: const Color.fromRGBO(235, 190, 170, 1),
                          width: 2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        child: YoutubePlayer(
                          controller: _controller,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 125,
                      margin: const EdgeInsets.only(left: 240),
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '#3 Trending',
                            style: TextStyle(
                              fontFamily: 'Baby',
                              color: Colors.pink[200],
                              wordSpacing: 1,
                            ),
                          ),
                          const SizedBox(width: 7.5),
                          const FaIcon(
                            FontAwesomeIcons.fireFlameCurved,
                            color: Colors.orange,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        tip.description,
                        style: const TextStyle(
                          fontFamily: 'iosReg',
                          color: Color.fromARGB(175, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 1500,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 15,
                            offset: Offset(0, -12.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 75,
                                height: 110,
                                child: Image.asset(
                                  './assets/images/pregnant.gif',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Quick ${tip.text} On The Go",
                                style: const TextStyle(
                                  fontFamily: 'Baby',
                                  fontSize: 22,
                                  color: Color.fromRGBO(235, 190, 170, 1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 300,
                            child: Divider(
                              thickness: 0.35,
                            ),
                          ),
                          const Expanded(
                            child: StepsList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
