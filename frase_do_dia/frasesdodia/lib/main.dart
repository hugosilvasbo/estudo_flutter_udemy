import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Frases do dia',
    home: Container(
      margin: const EdgeInsets.only(top: 40),
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text('t1'),
          Text('t2'),
          Text('t3'),
        ],
      ),
    ),
  ));
}
