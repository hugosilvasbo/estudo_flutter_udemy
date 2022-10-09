import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Frases do dia',
    home: Container(
      margin: const EdgeInsets.only(top: 40),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
      child: Image.asset("images/tigre.jpg",
        fit: BoxFit.scaleDown,
      )
    ),
  ));
}
