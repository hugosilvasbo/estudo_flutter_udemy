import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  String nome;

  TelaSecundaria({this.nome = ''});

  @override
  State<TelaSecundaria> createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Secundaria"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            // para recuperar os atributos da tela acima, basta usar widget
            Text("Valor passado: ${widget.nome}"),
          ],
        ),
      ),
    );
  }
}
