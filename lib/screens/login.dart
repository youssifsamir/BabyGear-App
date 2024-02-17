//packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/tabs.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = './login.dart';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '', password = '';
  bool show = false;

  void login(AccountsProvider provider) {
    if (provider.login(username, password)) {
      int count = 0;
      provider.setCurrentUser(username);
      provider.initilaizeBaby();
      provider.setCurrentLocation();
      Navigator.of(context).popUntil((_) => count++ >= 2);
      Navigator.of(context).popAndPushNamed(
        TabScreen.routeName,
        arguments: username,
      );
      //Snackbar - Successful
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: <Widget>[
              Text(
                'Welcome Back ${provider.getByUsername(provider.currentUser).firstName} !',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(
                './assets/images/hand.gif',
                height: 30,
                width: 30,
              )
            ],
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          padding: EdgeInsets.only(top: 10),
          content: Text(
            '                       Wrong Username or Password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Open Sans',
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);

    var wallpaper = const AssetImage('./assets/images/babydoodle.png');
    var wallimage = Image(
      image: wallpaper,
      fit: BoxFit.cover,
      height: double.infinity,
    ); //<- Creates a wid

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
          Positioned(
            top: 130,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80),
              ),
              child: Container(
                width: 390,
                height: 720,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 30),

                    //Login text
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Freehand',
                        color: Theme.of(context).primaryColor,
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
                    const SizedBox(height: 15),

                    //Username
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 300,
                            height: 40,
                            color: const Color.fromRGBO(0, 0, 0, 0.03),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 4),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                cursorWidth: 2,
                                cursorHeight: 20,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Icon(
                                      Icons.person_outline_sharp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  hintText: 'Username',
                                  hintStyle: const TextStyle(
                                    color: Colors.black26,
                                    fontSize: 14,
                                  ),
                                ),
                                onChanged: (value) => setState(
                                  () {
                                    username = value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    //Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 300,
                            height: 40,
                            color: const Color.fromRGBO(0, 0, 0, 0.03),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 5),
                              child: Stack(
                                children: <Widget>[
                                  TextField(
                                    textInputAction: TextInputAction.go,
                                    onSubmitted: (value) {
                                      login(provider);
                                    },
                                    cursorWidth: 2,
                                    cursorColor: Theme.of(context).primaryColor,
                                    // style: TextStyle(fontSize: show ? 16 : 20),
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      icon: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Icon(
                                          show
                                              ? Icons.lock_open_rounded
                                              : Icons.lock_outline,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintStyle: const TextStyle(
                                        color: Colors.black26,
                                        fontSize: 14,
                                      ),
                                    ),
                                    obscureText: show ? false : true,
                                    onChanged: (value) => setState(
                                      () {
                                        password = value;
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    right: 5,
                                    bottom: -10,
                                    child: IconButton(
                                      onPressed: () => setState(
                                        () {
                                          show = !show;
                                        },
                                      ),
                                      icon: Icon(show
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),

                    //Forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: 55),
                      ],
                    ),
                    const SizedBox(height: 25),

                    //Login Button + Snackbars + Navigator
                    GestureDetector(
                      onTap: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);

                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        login(provider);
                      },
                      child:
                          // Login Button
                          Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(41, 0, 0, 0),
                              blurRadius: 4,
                              offset: Offset(2, 10),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(250),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Baby',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    //Divider
                    const SizedBox(
                      width: 250,
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    const SizedBox(height: 30),

                    //Google Button
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(2, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(250),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 22),
                          Image.asset(
                            './assets/images/google.png',
                            width: 28,
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'Login with Google',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 50),
                          const FaIcon(FontAwesomeIcons.arrowRight)
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    //Facebook Button
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 2,
                            offset: Offset(2, 10), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.circular(250),
                        color: const Color.fromRGBO(59, 89, 152, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(width: 22),
                          FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: 28,
                          ),
                          SizedBox(width: 22),
                          Text(
                            'Login with Facebook',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 30),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    //Apple Button
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 2,
                            offset: Offset(2, 10), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.circular(250),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          SizedBox(width: 25),
                          FaIcon(
                            FontAwesomeIcons.apple,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(width: 27),
                          Text(
                            'Login with Apple',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 55),
                          FaIcon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
