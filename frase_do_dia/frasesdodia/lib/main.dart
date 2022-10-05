import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Frases do dia',
    home: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          TextButton(
            onPressed: () {
              print("Botão pressionado!");
            },
            child: const Text(
              "Botão",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
          )
        ],
      ),
    ),
  ));
}
