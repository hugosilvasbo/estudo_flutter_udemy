import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco.db");

    var retorno = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoRecente) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER)";
        db.execute(sql);
      },
    );

    return retorno;
  }

  _salvar() async {
    Database db = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Maria Aparecida",
      "idade": 70
    };
    int id = await db.insert("usuarios", dadosUsuario);

    print("Salvo: $id");
  }

  _listarUsuarios() async {
    Database db = await _recuperarBancoDados();

    String sql = "SELECT * FROM usuarios WHERE nome = 'Maria Aparecida'";
    List usuarios = await db.rawQuery(sql);

    for (var usuario in usuarios) {
      print("Item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }

    //print("usuarios: " + usuarios.toString());
  }

  _recuperarUsuarioPeloID(int id) async {
    Database db = await _recuperarBancoDados();

    List usuarios = await db.query(
      "usuarios",
      columns: ["id", "nome", "idade"],
      where: "id = ? AND nome = ? AND idade = ?",
      whereArgs: [id, "Maria Aparecida", 70],
    );

    for (var usuario in usuarios) {
      print("Item id: " +
          usuario['id'].toString() +
          " nome: " +
          usuario['nome'] +
          " idade: " +
          usuario['idade'].toString());
    }
  }

  _excluirUsuario(int id) async {
    Database db = await _recuperarBancoDados();

    int retorno = await db.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );

    print("item qtde removida: ${retorno}");
  }

  _atualizarUsuario(int id) async {
    Database db = await _recuperarBancoDados();

    Map<String, dynamic> dadosUsuario = {
      "nome": "Maria Aparecida",
      "idade": 30
    };

    int retorno = await db.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?",
      whereArgs: [id],
    );

    print("Quantidade atualizada: ${retorno}");
  }

  @override
  Widget build(BuildContext context) {
    //_salvar();
    //_listarUsuarios();
    //_recuperarUsuarioPeloID(3);
    //_excluirUsuario(2);
    _atualizarUsuario(1);

    return Container();
  }
}
