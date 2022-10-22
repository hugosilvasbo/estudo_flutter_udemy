import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  State<EntradaSlider> createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 5;
  String _label = "Valor selecionado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Slider"),
      ),
      body: Container(
        padding: EdgeInsets.all(60),
        child: Column(
          children: [
            Slider(
              value: _valor,
              min: 0,
              max: 10,
              label: _label,
              divisions: 10,
              activeColor: Colors.red,
              inactiveColor: Colors.purple,
              onChanged: (double novoValor) {
                setState(() {
                  _valor = novoValor;
                  _label = "Valor selecionado " + novoValor.toString();
                });
              },
            ),
            ElevatedButton(
              child: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                print("Valor selecionado : " + _valor.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
