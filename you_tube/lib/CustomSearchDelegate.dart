import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // query é o que foi digitado
          // entao limpo a pesquisa...
          query = "";
        },
      ),
      IconButton(
        icon: Icon(Icons.done),
        onPressed: () {
          print("Nao faz nada...");
        },
      ),
    ];
  }

  // botao voltar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  // é chamado assim que o usuario faz a pesquisa
  @override
  Widget buildResults(BuildContext context) {
    print("resultado: a pesquisa está sendo realizada");
    close(context, query);
    return Container();
  }

  // esse cara é chamado toda vez que o usuario digitar alguma coisa no campo...
  @override
  Widget buildSuggestions(BuildContext context) {
    print("resultado: digitado " + query);
    return Container();
    
    /* --> apenas um exemplo de como usar suggestions...
    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = ["Android", "Android navegação", "IOS", "Jogos"]
          .where((texto) => texto.toLowerCase().startsWith(query))
          .toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
            onTap: () {
              close(context, lista[index]);
            },
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa"),
      );
    }*/
  }
}
