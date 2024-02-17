//packages
import 'dart:io';
import 'package:babyshop_app/providers/accounts.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

//providers
import '/providers/form.dart';

//screens
import '/screens/tabs.dart';

class AvatarUploader extends StatefulWidget {
  static const routeName = './market.dart';

  @override
  // ignore: library_private_types_in_public_api
  _AvatarUploader createState() => _AvatarUploader();
}

class _AvatarUploader extends State<AvatarUploader> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media, FormProvider form) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
    });
    form.setImage(image!.path);
  }

  //show popup dialog
  void myAlert(FormProvider form) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Choose media to upload from',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontFamily: 'Open Sans',
                fontSize: 18,
              ),
            ),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery, form);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(2, 10),
                          ),
                        ],
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'From Gallery',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera, form);
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(41, 0, 0, 0),
                            blurRadius: 4,
                            offset: Offset(2, 10),
                          ),
                        ],
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'From Camera',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final form = Provider.of<FormProvider>(context);
    final account = Provider.of<AccountsProvider>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () => myAlert(form),
            child: Container(
              width: 240,
              height: 230,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26, width: 0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
                color: Colors.white,
              ),
              child: form.image != ''
                  ? ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(200),
                      ),
                      child: Image.file(
                        File(form.image),
                        fit: BoxFit.cover,
                        width: 240,
                        height: 230,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cloud_upload,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Tap to upload",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Open Sans',
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 70),
          GestureDetector(
            onTap: () {
              form.image != ''
                  ? account.getByUsername(account.currentUser).avatar =
                      form.image
                  : account.getByUsername(account.currentUser).avatar =
                      './assets/images/avatar.png';
              Navigator.popAndPushNamed(context, TabScreen.routeName);
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
                        'Welcome ${account.getByUsername(account.currentUser).firstName} !',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        './assets/images/hand.gif',
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                  duration: const Duration(seconds: 4),
                ),
              );
            },
            child: Container(
              width: 320,
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
              child: Center(
                child: Text(
                  form.image != ''
                      ? 'YOUR ACCOUNT IS READY!'
                      : '  SKIP FOR NOW . . .',
                  style: const TextStyle(
                    fontFamily: 'Baby',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
