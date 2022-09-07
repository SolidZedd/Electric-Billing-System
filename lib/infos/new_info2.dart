import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing/button_widget.dart';
import 'package:testing/export.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing/User.dart';
import 'package:gsheets/gsheets.dart';
import 'package:testing/pages/new.dart';
import 'package:testing/user_fields.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;

class NewInfo2 extends StatefulWidget {
  final String textFromFile;

  const NewInfo2({Key? key, required this.textFromFile}) : super(key: key);

  @override
  State<NewInfo2> createState() => _NewInfo2State();
}

class _NewInfo2State extends State<NewInfo2> {
  String text = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  String textID = '';

  final folioController = TextEditingController(text: 'P-256');
  final meterController = TextEditingController(text: '71');
  final consumerController = TextEditingController(text: '12');
  final readingController = TextEditingController();

  File? image;
  File? image2;

  getData() async {
    String response1;
    String response2;
    String response3;
    String response4;
    String response5;
    String responseID;

    response1 = await rootBundle.loadString('textfiles/1/Folio1.txt');
    response2 = await rootBundle.loadString('textfiles/1/Folio2.txt');
    response3 = await rootBundle.loadString('textfiles/1/Folio3.txt');
    response4 = await rootBundle.loadString('textfiles/1/Folio4.txt');
    response5 = await rootBundle.loadString('textfiles/1/Folio5.txt');
    responseID = await rootBundle.loadString('textfiles/1/ID.txt');

    setState(() {
      text = response1;
      text2 = response2;
      text3 = response3;
      text4 = response4;
      text5 = response5;
      textID = responseID;
    });
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImagePermanently(image.path);

      setState(() => this.image = imagePermanent);
    } on PlatformException catch (e) {
      print('Failed to pick an Image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getExternalStorageDirectory();
    final name = basename('Folio P-256 pic1.jpg');
    final image = File('${directory?.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Future pickImage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image2 == null) return;
      // final imageTemp = File(image2.path);
      final imagePer = await saveImage(image2.path);

      setState(() => this.image2 = imagePer);
    } on PlatformException catch (e) {
      print('Failed to pick an Image: $e');
    }
  }

  Future<File> saveImage(String path) async {
    final dir = await getExternalStorageDirectory();
    final name = basename('Folio P-256 pic2.jpg');
    final image2 = File('${dir?.path}/$name');

    return File(path).copy(image2.path);
  }

  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POF Electric Billing System'),
        backgroundColor: Color.fromRGBO(13, 39, 132, 1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => NewPage()));
                      },
                      child: Text(
                        'Back',
                        style: TextStyle(
                            color: Color.fromRGBO(13, 39, 132, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ),
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 50,
                  width: 100,
                ),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 0,
                      child: ElevatedButton(
                          onPressed: () {
                            getData();
                          },
                          child: Text(getData().toString()))),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 200, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Folio No.',
                      ),
                      controller: folioController,
                    ),
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //       border: UnderlineInputBorder(), labelText: 'Meter No.'),
                  //   controller: meterController,
                  // ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //       border: UnderlineInputBorder(), labelText: 'Consumer No.'),
                  //   controller: consumerController,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, right: 200, left: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Current Reading',
                      ),
                      controller: readingController,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromRGBO(13, 39, 132, 1)),
                                  onPressed: () => pickImage(),
                                  child: const Text(
                                    'Upload Pic 1',
                                    style: TextStyle(fontSize: 15),
                                  )),
                              image != null
                                  ? Image.file(
                                      image!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(
                                      Icons.image_outlined,
                                      size: 120,
                                    ),
                            ],
                          ),
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(13, 39, 132, 1)),
                                onPressed: () => pickImage2(),
                                child: Text(
                                  'Upload Pic 2',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              image2 != null
                                  ? Image.file(
                                      image2!,
                                      width: 150,
                                      height: 150,
                                      fit: BoxFit.fill,
                                    )
                                  : Icon(
                                      Icons.image_outlined,
                                      size: 120,
                                    )
                            ],
                          ),
                        ],
                      ),

                      // ElevatedButton(
                      //   onPressed: () {
                      //     // print(folioController.text);
                      //     // print(meterController.text);
                      //     // print(consumerController.text);
                      //     // print(readingController.text);
                      //     //
                      //     // storedata();
                      //
                      //     onClicked:
                      //     () async {
                      //       final user = {
                      //         UserFields.folio: folioController.text,
                      //         UserFields.meter: meterController.text,
                      //         UserFields.consumer: consumerController.text,
                      //         UserFields.reading: readingController.text,
                      //       };
                      //       await UserSheetApi.insert([user]);
                      //     };
                      //   },
                      //   child: const Text('Save'),
                      // )
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          children: [
                            ButtonWidget(
                              text: 'Save',
                              onClicked: () async {
                                final user = {
                                  UserFields.id: textID,
                                  UserFields.folio: folioController.text,
                                  UserFields.meter: meterController.text,
                                  UserFields.consumer: consumerController.text,
                                  UserFields.reading: readingController.text,
                                  UserFields.path1: image?.path,
                                  UserFields.path2: image2?.path,
                                };
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Text(
                                        'Submitted!',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      contentPadding: EdgeInsets.all(8),
                                    );
                                  },
                                );
                                await UserSheetApi.insert([user]);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
