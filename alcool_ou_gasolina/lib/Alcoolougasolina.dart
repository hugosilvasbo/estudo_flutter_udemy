import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({Key? key}) : super(key: key);

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número inválido, digite números maiores que 0 e utilizando (.)";
      });
    } else {
      /**
       * Se o preço do alcool dividido pelo preço da gasolina
       * for >= a 0.7 é melhor abastecer com gasolina
       * senão é melhor utilizar álcool
       */

      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _textoResultado = "Melhor abastecer com álcool";
        });

        _limparCampos();
      }
    }
  }

  void _limparCampos() {
    // Quando uso controlador do campo, não preciso usar
    //o SetState
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Preço Alcool, ex 1.59"),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration:
                    InputDecoration(labelText: "Preço Gasolina, ex 3.15"),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      backgroundColor: Colors.deepOrangeAccent,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  onPressed: _calcular,
                  child: Text("Calcular"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
