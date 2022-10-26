import 'dart:math';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _resultado = "Resultado";

  //Comunicação síncrona e assincrona
  void _recuperarCep() async {
    String cep = "13457040";
    String url = "https://viacep.com.br/ws/${cep}/json/";

    http.Response response;
    response = await http.get(url);

    // pega o retorno do objeto
    // converti para um objeto json
    // depois passei para o map
    Map<String, dynamic> retorno = json.decode(response.body);

    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${bairro}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o cep: ex: 13457040",
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: ,
            ),
            ElevatedButton(
              onPressed: _recuperarCep,
              child: Text("Clique aqui"),
            ),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
