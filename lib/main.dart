// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:testing/Pages/new3.dart';
import 'package:testing/export.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testing/pages/new.dart';
import 'package:testing/Pages/New2.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();
  // const primaryColor=Color(#)
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(225, 231, 230, 1),
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textFromFile = '';
  final myController = TextEditingController();
  final password = TextEditingController();

  getData() async {
    String response;
    response = await rootBundle.loadString('textfiles/Text1.txt');
    setState(() {
      textFromFile = response;
    });
  }

  clear() {
    setState(() {
      textFromFile = '';
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('POF Electricity Billing System'),
          backgroundColor: Color.fromRGBO(13, 39, 132, 1),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                child: Image(
                    image: AssetImage(
                  'assets/images/logo.png',
                )),
              ),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Meter ID',
                        labelStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                      ),
                      controller: myController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 18),
                    child: TextField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      obscureText: true,
                      controller: password,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(13, 39, 132, 1)),
                        onPressed: () {
                          if (myController.text == '1' &&
                              password.text == 'first') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewPage()));
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    'Error',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                );
                              },
                            );
                          }
                          if (myController.text == '2' &&
                              password.text == 'second') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewPage2()));
                          }
                          if (myController.text == '3' &&
                              password.text == 'third') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NewPage3()));
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),

                  // InkWell(
                  //   child: Text(
                  //     textFromFile,
                  //     style: TextStyle(fontSize: 20),
                  //   ),
                  //   onTap: () => launchUrl(Uri.parse(
                  //       'https://stackoverflow.com/questions/55995791/how-can-i-resolve-the-argument-type-string-cant-be-assigned-to-the-parameter')),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     getData();
                  //   },
                  //   child: const Text('Get data'),
                  // ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     clear();
                  //   },
                  //   child: const Text('Clear'),
                  // ),
                  // FloatingActionButton(
                  //   // When the user presses the button, show an alert dialog containing
                  //   // the text that the user has entered into the text field.
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) {
                  //         return AlertDialog(
                  //           // Retrieve the text that the user has entered by using the
                  //           // TextEditingController.
                  //           content: Text(myController.text),
                  //         );
                  //       },
                  //     );
                  //   },
                  //   tooltip: 'Show me the value!',
                  //   : const Icon(Icons.text_fields),
                  // ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
