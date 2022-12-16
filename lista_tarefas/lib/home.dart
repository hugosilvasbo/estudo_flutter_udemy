import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTarefas = [];

  _salvarArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    var arquivo = File("${diretorio.path}/dados.json");

    // Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = "Ir ao mercado";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        backgroundColor: Colors.pink,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    decoration: InputDecoration(labelText: "Digite sua tarefa"),
                    onChanged: (value) => {},
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"),
                    )
                  ],
                );
              });
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTarefas.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_listaTarefas[index]));
              },
            ),
          )
        ],
      ),
    );
  }
}
