import 'package:flutter/material.dart';
import 'package:testing/info/consumer3.dart';
import 'package:testing/infos3/new3_info1.dart';
import 'package:testing/infos3/new3_info2.dart';
import 'package:testing/infos3/new3_info3.dart';
import 'package:testing/infos3/new3_info4.dart';
import 'package:testing/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:testing/info/consumer_info.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class NewPage3 extends StatefulWidget {
  const NewPage3({Key? key}) : super(key: key);

  @override
  State<NewPage3> createState() => _NewPage3State();
}

class _NewPage3State extends State<NewPage3> {
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
    response1 = await rootBundle.loadString('textfiles/3/Folio1.txt');
    response2 = await rootBundle.loadString('textfiles/3/Folio2.txt');
    response3 = await rootBundle.loadString('textfiles/3/Folio3.txt');
    response4 = await rootBundle.loadString('textfiles/3/Folio4.txt');
    response5 = await rootBundle.loadString('textfiles/3/Folio5.txt');
    responseID = await rootBundle.loadString('textfiles/3/ID.txt');
    setState(() {
      textFromFile = response1;
      text2 = response2;
      text3 = response3;
      text4 = response4;
      text5 = response5;
      id = responseID;
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
                                builder: (context) => ConsumerInfo3()));
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
                            builder: (context) => New3Info1()));
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
                            builder: (context) => New3Info2()));
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
                            builder: (context) => New3Info3()));
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
                            builder: (context) => New3Info4()));
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
