/*
Collection ou coleções -> são implementações de estruturas de dados, que é utilizado para armazenar itens
 - List
 - Maps
*/

void main() {
	
  /*
  chave -> valor
  List frutas = ["Morango", "Manga"];
  print( frutas[0] );
  
  
  Map frutas = Map();
  frutas[0] = "Morango";
  frutas[1] = "Manga";
  print( frutas[0] );
  */
  
  //chave -> valor
  Map<String, String> estados = Map();
  estados["SP"] = "São Paulo";
  estados["MG"] = "Minas Gerais";
  estados["RJ"] = "Rio Janeiro";
  
  Map<String, dynamic> usuarios = Map();
  usuarios["nome"] = "Jamilton";
  usuarios["idade"] = 30;
  
  //print( estados.keys );
  //print( estados.values );
  //print( estados.containsKey("MA") );
  //print( estados.containsValue("Ceará") );
  //print( estados.length );
  /*
  estados.forEach(
  	(chave, valor) => print(" $chave - $valor ")
  );*/
  
  //print( estados );
  
}