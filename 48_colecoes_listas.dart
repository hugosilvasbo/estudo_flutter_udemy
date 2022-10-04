/*
Collection ou coleções -> são implementações de estruturas de dados, que é utilizado para armazenar itens
 - List
 - Maps
*/

class Usuario {
  
  String nome;
  int idade;
  
  Usuario(this.nome, this.idade);
  
}

void main() {
  
  List<String> frutas = ["Morango", "Manga", "Melancia"];
  //List numero = [1, 5, "Jamilton", 10.60];
  
  //adicionar itens
  //frutas.add("Melancia");
  //Inserir em uma posição
  //frutas.insert(1, "Abacaxi");
  
  //Remover item
  //frutas.removeAt(1);
  
  //Verificar item na lista
  //print( frutas.contains("Pera") );
  
  //tamanho da lista
  //print( frutas.length );
  //print( frutas );
  
  //Armazenar objetos
	
  List<Usuario> usuarios = List();
  usuarios.add( Usuario("Jamilton", 30) );
  usuarios.add( Usuario("Leticia", 28) );
  usuarios.add( Usuario("Jorge", 30) );
  
  for( Usuario usuario in usuarios ){
    print( "Nome: ${usuario.nome} idade: ${usuario.idade}" );
  }
  
  //print( usuarios );
  
}