import 'package:flutter/material.dart';

class EntradaSwitch extends StatefulWidget {
  const EntradaSwitch({Key? key}) : super(key: key);

  @override
  State<EntradaSwitch> createState() => _EntradaSwitchState();
}

class _EntradaSwitchState extends State<EntradaSwitch> {
  bool _escolhaUsuario = false;
  bool _escolhaConfig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada Switch"),
      ),
      body: Container(
        child: Column(
          children: [
            SwitchListTile(
              activeColor: Colors.yellow,
              title: Text("Receber notificações"),
              value: _escolhaUsuario,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),
            SwitchListTile(
              activeColor: Colors.yellow,
              title: Text("Carregar imagens automaticamente"),
              value: _escolhaConfig,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaConfig = valor;
                });
              },
            ),
            ElevatedButton(
                child: Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print("Escolha usuário: " + _escolhaUsuario.toString());
                  print("Escolha config: " + _escolhaConfig.toString());
                })
            /*Switch(
              value: _escolhaUsuario,
              onChanged: (bool valor) {
                setState(() {
                  _escolhaUsuario = valor;
                });
              },
            ),
            Text("Receber notificações?"),
          */
          ],
        ),
      ),
    );
  }
}
