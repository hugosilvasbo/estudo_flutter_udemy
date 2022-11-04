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

  _post() async {
    // Forma mais bonita de se fazer..
    Post post = new Post(120, 0, "Título", "Corpo da mensagem");
    var corpo = json.encode(post.toJson());

    http.Response response = await http.post(
      _urlBase + "/posts",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _put() async {
    var corpo = json.encode(
        {
          "userId": 120,
          "id": null,
          "title": "Título alterado",
          "body": "Corpo da postagem alterada"
        }
    );

    http.Response response = await http.put(
      _urlBase + "/posts/2",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _patch() async {
    var corpo = json.encode(
        {
          "userId": 121,
          "body": "Corpo da postagem alterada"
        }
    );

    http.Response response = await http.patch(
      _urlBase + "/posts/2",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      },
      body: corpo,
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  _delete() async {
    http.Response response = await http.delete(
      _urlBase + "/posts/1"
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de serviço avançado'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: _post,
                    child: Text("Salvar"),
                ),
                ElevatedButton(
                  // no put, precisa enviar o objeto inteiro para que
                  // os dados sejam atualizados.
                  onPressed: _patch,
                  //onPressed: _put,
                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: _delete,
                  child: Text("Remover"),
                ),
              ],
            ),
            // quando se tem uma lista e os botoes em cima (por exemplo)
            // deve usar o expanded, pois senao a lista nao entende o quanto
            // de espaço deve ocupar.
            Expanded(
                child: FutureBuilder<List<Post>>(
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
                          return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {

                              List<Post> lista = snapshot.data!;
                              Post post = lista[index];

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
                              );
                            },
                          );
                        }
                    }
                  },
                ),
            )
          ],
        ),
      ),
     );
  }
}
