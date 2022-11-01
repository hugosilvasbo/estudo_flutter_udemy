import 'package:flutter/material.dart';
import 'package:future/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";

  Post post = Post(0, 1, "", "");

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode( response.body );

    List<Post> postagens = [];
    for(var post in dadosJson){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de serviço avançado'),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasError) {
                return Text("Erro ao carregar");
              } else {
                print("Lista: carregou");
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {

                      List<Post> lista = snapshot.data!;
                      Post post = lista[index];

                      return ListTile(
                        title: Text("teste"),
                        subtitle: Text("teste"),
                      );
                    },
                );
              }
          }
        },
      ),
     );
  }
}
