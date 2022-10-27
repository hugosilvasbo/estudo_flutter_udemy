import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregarItens() {
    _itens = [];

    for(int i=0; i <= 20; i++) {
      Map<String, dynamic> item = Map();

      item["titulo"] = "Título ${i}";
      item["descricao"] = "Descrição ${i}";

      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregarItens();

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = _itens[index];

            return ListTile(
              title: Text(item["titulo"]),
              subtitle: Text(item["descricao"]),
            );
          },
        ),
      ),
    );
  }
}
