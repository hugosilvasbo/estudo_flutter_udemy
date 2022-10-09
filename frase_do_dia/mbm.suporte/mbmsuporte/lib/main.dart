import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'MBM Suporte',
      home: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(6),
        child: Container(
          color: const Color.fromARGB(255, 127, 150, 148),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.green,
                    child: const Text("Confia"),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 200,
                    color: Colors.lightBlue,
                    child: const Text("Desconfia"),
                  )
                ],
              ),
            ],
          ),
        ),
      )));
}
