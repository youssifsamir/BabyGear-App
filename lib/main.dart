//packages;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

// //providers
import '/providers/form.dart';
import '/providers/tips.dart';
import 'providers/accounts.dart';
import 'providers/products.dart';
import 'providers/billboard.dart';
import 'providers/bottomappbar.dart';
import '/providers/subscriptions.dart';

// //screens
import 'screens/tabs.dart';
import 'screens/login.dart';
import 'screens/market.dart';
import 'screens/profile.dart';
import 'screens/landing.dart';
import 'screens/settings.dart';
import 'screens/contactus.dart';
import 'screens/tips/tips.dart';
import 'screens/signupp/signup.dart';
import 'screens/signupp/verify.dart';
import 'screens/signupp/avatar.dart';
import '/screens/tips/tipsdetials.dart';
import 'screens/market/marketsubs.dart';
import '/screens/products/prodgate.dart';
import '/screens/products/prodetails.dart';
import 'screens/market/marketlanding.dart';
import 'screens/subscriptions/subtoy.dart';
import 'screens/subscriptions/subgate.dart';
import 'screens/subscriptions/submother.dart';

//widgets
import 'widgets/addcard.dart';

//main
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

//mainWidget
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TipsProvider()),
        ChangeNotifierProvider(create: (ctx) => FormProvider()),
        ChangeNotifierProvider(create: (ctx) => AccountsProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => BillboardProvider()),
        ChangeNotifierProvider(create: (ctx) => SubscriptionProvider()),
        ChangeNotifierProvider(create: (ctx) => BottomAppBarProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 28, 145, 141),
          snackBarTheme: const SnackBarThemeData(
            backgroundColor: Color.fromARGB(255, 28, 145, 141),
            contentTextStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Open Sans',
              color: Colors.white,
            ),
          ),
        ),
        home: LandingScreen(),
        routes: {
          SubToy.routeName: (ctx) => SubToy(),
          ProdGate.routeName: (ctx) => ProdGate(),
          TabScreen.routeName: (ctx) => TabScreen(),
          ContactUs.routeName: (ctx) => ContactUs(),
          SubMother.routeName: (ctx) => SubMother(),
          MarketSubs.routeName: (ctx) => MarketSubs(),
          TipsScreen.routeName: (ctx) => TipsScreen(),
          TipsDetails.routeName: (ctx) => TipsDetails(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          ProdDetails.routeName: (ctx) => ProdDetails(),
          VerifyScreen.routeName: (ctx) => VerifyScreen(),
          AvatarScreen.routeName: (ctx) => AvatarScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          MarketScreen.routeName: (ctx) => MarketScreen(),
          AddCreditCard.routeName: (ctx) => AddCreditCard(),
          MarketLanding.routeName: (ctx) => MarketLanding(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          SubscriptionHome.routeName: (ctx) => const SubscriptionHome(),
        },
      ),
    );
  }
}
