import 'package:flutter/material.dart';

import 'TelaSecundaria.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/",
      routes: {
        "/secundaria": (context) => TelaSecundaria(),
      },
      home: TelPrincipal(),
    ),
  );
}

class TelPrincipal extends StatefulWidget {
  const TelPrincipal({Key? key}) : super(key: key);

  @override
  State<TelPrincipal> createState() => _TelPrincipalState();
}

class _TelPrincipalState extends State<TelPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaSecundaria(nome: "Hugo"),
                  ),
                );*/
                Navigator.pushNamed(context, "/secundaria");
              },
              child: Text("Ir para a segunda tela"),
            ),
          ],
        ),
      ),
    );
  }
}
