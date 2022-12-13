import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();

  _salvar() {}

  _recuperar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Nada salvo!",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Digite algo"),
              controller: _controllerCampo,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _salvar,
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  child: Text(
                    "Recuperar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
