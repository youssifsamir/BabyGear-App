//packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//providers
import '/providers/accounts.dart';

//screens
import '/screens/signupp/verify.dart';

// ignore: use_key_in_widget_constructors
class SignupScreen extends StatefulWidget {
  static const routeName = './signup.dart';

  @override
  State<SignupScreen> createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen> {
  String username = '',
      password = '',
      email = '',
      confirmPassword = '',
      firstName = '',
      lastName = '',
      phoneNo = '',
      gender = '',
      code = '';
  bool show = false,
      show2 = false,
      invpass = false,
      invpasslen = false,
      invemail = false,
      invphone = false,
      empty = false;

  void signup(AccountsProvider provider) {
    username == '' ||
            password == '' ||
            email == '' ||
            firstName == '' ||
            lastName == '' ||
            phoneNo == '' ||
            gender == '' ||
            confirmPassword == ''
        ? empty = true
        : !email.contains('@') || !email.contains('.com')
            ? invemail = true
            : phoneNo.length != 11
                ? invphone = true
                : password.length < 8
                    ? invpasslen = true
                    : password != confirmPassword
                        ? invpass = true
                        : null;
    if (!empty && !invemail && !invpass && !invphone && !invpasslen) {
      Account account = Account(
        age: 'null',
        username: username,
        password: password,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phoneNo: phoneNo,
        gender: gender,
        babies: [],
        locations: [],
        transactions: [],
        history: [],
        creditCards: [],
        rents: [],
        settings: Settings(
          camera: false,
          livelocation: false,
          newsletter: false,
          notifications: false,
          gallery: false,
        ),
        isPrem: false,
        avatar: 'null',
        disable: false,
      );
      provider.currentBaby = Baby(
        id: -1,
        name: '',
        age: 0,
        dob: DateTime(0, 0, 0),
        months: false,
        gender: 'null',
        height: 0,
        weight: 0,
      );
      Navigator.of(context)
          .pushNamed(VerifyScreen.routeName, arguments: account);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.only(top: 10),
          content: SizedBox(
            height: 37,
            child: Center(
              child: Text(
                empty
                    ? 'Please fill in all details'
                    : invemail
                        ? 'Invalid email'
                        : invphone
                            ? 'Invalid phone number '
                            : invpasslen
                                ? 'Password too short, atleast 8 characters'
                                : invpass
                                    ? 'Passwords do not match'
                                    : '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Open Sans',
                ),
              ),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
      empty = false;
      invemail = false;
      invpass = false;
      invphone = false;
      invpasslen = false;
    }
  }

  bool sm = false;
  double topPadding = 10;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AccountsProvider>(context);

    var wallpaper = const AssetImage('./assets/images/babydoodle.png');
    var wallimage = Image(
      image: wallpaper,
      fit: BoxFit.cover,
      height: double.infinity,
    );

    void animate() {
      setState(
        () {
          sm = !sm;
          topPadding = sm ? 230 : 10;
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          AnimatedContainer(
            curve: Curves.linearToEaseOut,
            duration: const Duration(milliseconds: 1075),
            padding: EdgeInsets.only(bottom: 0, top: topPadding),
            child: ListView(
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
                    child: sm
                        ? Column(
                            children: <Widget>[
                              const SizedBox(height: 30),
                              //Login text
                              Text(
                                'Signup',
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
                                      'Signup with Google',
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 22),
                                    FaIcon(
                                      FontAwesomeIcons.facebook,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                    SizedBox(width: 22),
                                    Text(
                                      'Signup with Facebook',
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 25),
                                    FaIcon(
                                      FontAwesomeIcons.apple,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    SizedBox(width: 27),
                                    Text(
                                      'Signup with Apple',
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
                              const SizedBox(height: 50),
                              GestureDetector(
                                onTap: () => animate(),
                                child: Container(
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
                                      'TETINA  ACCOUNT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Baby',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 500)
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              const SizedBox(height: 30),
                              //Login text
                              Text(
                                'Signup',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(
                                    'I am a',
                                    style: TextStyle(
                                      fontFamily: 'iosReg',
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => Colors.pink,
                                        ),
                                        activeColor: Colors.pink,
                                        value: 'Mother',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Mother',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Open Sans',
                                          color: Colors.pink,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(
                                        fillColor:
                                            MaterialStateColor.resolveWith(
                                          (states) => Colors.blue,
                                        ),
                                        activeColor: Colors.blue,
                                        value: 'Father',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value.toString();
                                          });
                                        },
                                      ),
                                      const Text(
                                        'Father',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Open Sans',
                                          color: Colors.blue,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 145,
                                          height: 40,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.03),
                                          child: TextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorWidth: 2,
                                            cursorHeight: 20,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      bottom: 5),
                                              border: InputBorder.none,
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, bottom: 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.idCard,
                                                  size: 20,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              hintText: 'First Name',
                                              hintStyle: const TextStyle(
                                                color: Colors.black26,
                                                fontSize: 14,
                                              ),
                                            ),
                                            onChanged: (value) => setState(
                                              () {
                                                firstName = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 145,
                                          height: 40,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.03),
                                          child: TextField(
                                            textInputAction:
                                                TextInputAction.next,
                                            cursorWidth: 2,
                                            cursorHeight: 20,
                                            cursorColor:
                                                Theme.of(context).primaryColor,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      bottom: 5),
                                              border: InputBorder.none,
                                              icon: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, bottom: 0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.idCard,
                                                  size: 20,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              hintText: 'Last Name',
                                              hintStyle: const TextStyle(
                                                color: Colors.black26,
                                                fontSize: 14,
                                              ),
                                            ),
                                            onChanged: (value) => setState(
                                              () {
                                                lastName = value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.03),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 4),
                                        child: TextField(
                                          textInputAction: TextInputAction.next,
                                          cursorWidth: 2,
                                          cursorHeight: 20,
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Icon(
                                                Icons.person_outline_sharp,
                                                color: Theme.of(context)
                                                    .primaryColor,
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
                              //email
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 300,
                                      height: 40,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.03),
                                      child: TextField(
                                        textInputAction: TextInputAction.next,
                                        cursorWidth: 2,
                                        cursorHeight: 20,
                                        cursorColor:
                                            Theme.of(context).primaryColor,
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              bottom: 7.5),
                                          border: InputBorder.none,
                                          icon: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.email_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                          hintText: 'Email',
                                          hintStyle: const TextStyle(
                                            color: Colors.black26,
                                            fontSize: 14,
                                          ),
                                        ),
                                        onChanged: (value) => setState(
                                          () {
                                            email = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              //phoneNo
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 300,
                                      height: 40,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.03),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 4),
                                        child: TextField(
                                          textInputAction: TextInputAction.next,
                                          cursorWidth: 2,
                                          cursorHeight: 20,
                                          cursorColor:
                                              Theme.of(context).primaryColor,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                              RegExp(
                                                r"[0-9.]",
                                              ),
                                            ),
                                          ],
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Icon(
                                                Icons.local_phone_outlined,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            hintText: 'Phone Number',
                                            hintStyle: const TextStyle(
                                              color: Colors.black26,
                                              fontSize: 14,
                                            ),
                                          ),
                                          onChanged: (value) => setState(
                                            () {
                                              phoneNo = value;
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
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.03),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 5),
                                        child: Stack(
                                          children: <Widget>[
                                            TextField(
                                              cursorWidth: 2,
                                              cursorColor: Theme.of(context)
                                                  .primaryColor,
                                              decoration: InputDecoration(
                                                hintText: 'Password',
                                                icon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: Icon(
                                                    show
                                                        ? Icons
                                                            .lock_open_rounded
                                                        : Icons.lock_outline,
                                                    color: Theme.of(context)
                                                        .primaryColor,
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
                                                    : Icons
                                                        .remove_red_eye_outlined),
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
                              const SizedBox(height: 15),
                              //confirmPassword
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      width: 300,
                                      height: 40,
                                      color:
                                          const Color.fromRGBO(0, 0, 0, 0.03),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 5),
                                        child: Stack(
                                          children: <Widget>[
                                            TextField(
                                              textInputAction:
                                                  TextInputAction.go,
                                              onSubmitted: (value) {
                                                signup(provider);
                                              },
                                              cursorWidth: 2,
                                              cursorColor: Theme.of(context)
                                                  .primaryColor,
                                              // style: TextStyle(fontSize: show ? 16 : 20),
                                              decoration: InputDecoration(
                                                hintText: 'Confirm Password',
                                                icon: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 4),
                                                  child: Icon(
                                                    show2
                                                        ? Icons
                                                            .lock_open_rounded
                                                        : Icons.lock_outline,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                                border: InputBorder.none,
                                                hintStyle: const TextStyle(
                                                  color: Colors.black26,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              obscureText: show2 ? false : true,
                                              onChanged: (value) => setState(
                                                () {
                                                  confirmPassword = value;
                                                },
                                              ),
                                            ),
                                            Positioned(
                                              right: 5,
                                              bottom: -10,
                                              child: IconButton(
                                                onPressed: () => setState(
                                                  () {
                                                    show2 = !show2;
                                                  },
                                                ),
                                                icon: Icon(show2
                                                    ? Icons.remove_red_eye
                                                    : Icons
                                                        .remove_red_eye_outlined),
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
                              const SizedBox(height: 30),

                              //Login Button + Snackbars + Navigator
                              GestureDetector(
                                onTap: () {
                                  signup(provider);
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);

                                  if (!currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                },
                                child:
                                    // createAccount Button
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
                                      'CREATE ACCOUNT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Baby',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              //Divider
                              const SizedBox(
                                width: 250,
                                child: Divider(
                                  thickness: 1,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => setState(
                                  () {
                                    animate();
                                  },
                                ),
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                    ),
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
                                  child: Center(
                                    child: Text(
                                      'SIGNUP USING SOCIAL MEDIA',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontFamily: 'Baby',
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 50),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
