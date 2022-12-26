import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key}f);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloattingActionButton"),
      ),
      body: Text("Conteúdo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        //child: Icon(Icons.add),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        onPressed: () => {},
        //mini: true,
        //onPressed: () {
        //  print("Resultado: botão pressionado!");
        //}
      ),
      bottomNavigationBar: BottomAppBar(
        //shape: CircularNotchedRectangle(),
        child: Row(
          children: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        ),
      ),
    );
  }
}
