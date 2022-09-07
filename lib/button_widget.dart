import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.text, required this.onClicked,})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Color.fromRGBO(13, 39, 132, 1)),
        onPressed: onClicked,
        child: FittedBox(
          child: Text(text, style: TextStyle(fontSize: 20,),),),);
}