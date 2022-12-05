import 'package:flutter/material.dart';
import 'package:you_tube/telas/Biblioteca.dart';
import 'package:you_tube/telas/EmAlta.dart';
import 'package:you_tube/telas/Inicio.dart';
import 'package:you_tube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicio(), EmAlta(), Inscricao(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "imagens/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("acao: search");
            },
            icon: Icon(Icons.search),
          )
          /*IconButton(
            onPressed: () {
              print("acao: videocam");
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print("acao: account_circle");
            },
            icon: Icon(Icons.account_circle),
          ),
        ],*/
        ]
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
              label: "Início",
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              label: "Inscrições",
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              label: "Biblioteca",
              icon: Icon(Icons.folder)),
        ],
      ),
    );
  }
}
