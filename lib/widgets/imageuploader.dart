//packages
import 'dart:io';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:image_picker/image_picker.dart';

//providers
import '/providers/form.dart';

// ignore: use_key_in_widget_constructors
class ImageUploader extends StatefulWidget {
  static const routeName = './market.dart';

  @override
  // ignore: library_private_types_in_public_api
  _ImageUploader createState() => _ImageUploader();
}

class _ImageUploader extends State<ImageUploader> {
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
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
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
                            offset: Offset(2, 10), // Shadow position
                          ),
                        ],
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
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
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Row(
            children: <Widget>[
              Text(
                '  Product Image:',
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontFamily: 'Open Sans',
                ),
              ),
              const SizedBox(width: 28),
              GestureDetector(
                onTap: () => myAlert(form),
                child: Container(
                  width: 170,
                  height: 37,
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.cloud_upload,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '  Upload Photo',
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
          const SizedBox(height: 30),
          form.image != ''
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Image.file(
                      File(form.image),
                      fit: BoxFit.cover,
                      width: 350,
                      height: 330,
                    ),
                  ),
                )
              : Container(
                  width: 340,
                  height: 330,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 0),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.no_photography,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Open Sans',
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
