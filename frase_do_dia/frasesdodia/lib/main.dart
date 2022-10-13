import 'package:flutter/material.dart';

/**
 * Stateless -> Widgets que não podem ser alterados (constantes)
 * Stateful -> Widgets que podem ser alterados (variáveis)
 */

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeStateful(),
  ));
}

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  State<HomeStateful> createState() => _HomeStateful();
}

class _HomeStateful extends State<HomeStateful> {
  var _texto = "Hugo Souza";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instagram"),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _texto = "Curso Flutter";
                    });
                  },
                  child: Text("Clique aqui")),
              Text("Nome: $_texto")
            ],
          ),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _titulo = "Instagram";

    return Scaffold(
      appBar: AppBar(
        title: Text(_titulo),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text("Conteúdo principal"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [Text("Texto 1"), Text("Texto 1")],
          ),
        ),
      ),
    );
  }
}
