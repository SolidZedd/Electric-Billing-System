import 'package:flutter/material.dart';
import 'package:testing/infos/new_info1.dart';
import 'package:testing/infos/new_info2.dart';
import 'package:testing/infos/new_info3.dart';
import 'package:testing/infos/new_info4.dart';
import 'package:testing/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testing/info/consumer_info.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class NewPage extends StatefulWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  String textFromFile = '';
  String text2 = '';
  String text3 = '';
  String text4 = '';
  String text5 = '';
  String id = '';
  final myController = TextEditingController();

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
      textFromFile = response1;
      text2 = response2;
      text3 = response3;
      text4 = response4;
      text5 = response5;
      id = responseID;
    });
  }

  getData2() async {
    String response2;
    response2 = await rootBundle.loadString('textfiles/1/Folio1.txt');
    setState(() {
      text2 = response2;
    });
  }

  clear() {
    setState(() {
      textFromFile = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POF Billing System'),
        backgroundColor: Color.fromRGBO(13, 39, 132, 1),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomePage()));
                          },
                          child: Text(
                            'Log Out',
                            style: TextStyle(
                                color: Color.fromRGBO(13, 39, 132, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        height: 50,
                        width: 100,
                      ),
                    ],
                  ),
                  Text(
                    'Meter ID: $id',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 0,
                      child: Column(
                        children: [
                          ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                            onPressed: () {
                              getData();
                            },
                            child: Text(
                              getData().toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //     style: ElevatedButton.styleFrom(primary: Colors.white),
                    //     onPressed: () {
                    //       getData();
                    //     },
                    //     child: Text(
                    //       'Meter ID: ${myController.text} 1',
                    //       style: TextStyle(color: Colors.black),
                    //     )),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(13, 39, 132, 1)),
                      onPressed: () {
                        getData();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConsumerInfo1(
                                      textFromFile: textFromFile,
                                    )));
                      },
                      child: Text(
                        textFromFile,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(13, 39, 132, 1)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewInfo1(
                                  textFromFile: text2,
                                )));
                      },
                      child: Text(
                        text2,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(13, 39, 132, 1)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewInfo2(
                                  textFromFile: textFromFile,
                                )));
                      },
                      child: Text(
                        text3,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(13, 39, 132, 1)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewInfo3(
                                  textFromFile: textFromFile,
                                )));
                      },
                      child: Text(
                        text4,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(13, 39, 132, 1)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewInfo4(
                                  textFromFile: textFromFile,
                                )));
                      },
                      child: Text(
                        text5,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 25),
                    //   child: ElevatedButton(
                    //     style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13, 39, 132, 1)),
                    //     onPressed: () {
                    //       Navigator.of(context).push(
                    //           MaterialPageRoute(builder: (context) => HomePage()));
                    //     },
                    //     child: Text(
                    //       'Log Out',
                    //       style: TextStyle(fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
