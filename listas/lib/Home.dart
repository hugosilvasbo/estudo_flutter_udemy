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
              onTap: () {
                //print("Clique com onTap ${index}");
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(item["titulo"]),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.orange,
                      ),
                      content: Text(item["descricao"]),
                      backgroundColor: Colors.white,
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Sim"),
                        ),
                        ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Não"),
                        ),
                      ],
                      //contentPadding: EdgeInsets.all(80),
                    );
                  },
                );
              },
              /*onLongPress: () {
                print("Clique com onLongPress");
              },*/
              title: Text(item["titulo"]),
              subtitle: Text(item["descricao"]),
            );
          },
        ),
      ),
    );
  }
}