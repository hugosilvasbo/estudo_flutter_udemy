import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Entrada de dados"),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ));
  }
}
