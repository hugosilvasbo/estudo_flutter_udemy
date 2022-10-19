import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("imagens/logo.png"),
            Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            TextField(
                decoration: InputDecoration(labelText: "Preço Alcool, ex 1.59"),
                keyboardType: TextInputType.number),
            TextField(
              decoration: InputDecoration(labelText: "Preço Gasolina, ex 3.15"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Calcular"),
            ),
          ],
        ),
      ),
    );
  }
}
