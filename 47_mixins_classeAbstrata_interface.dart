/* 
Mixins é uma maneira de utilizar códigos em múltiplas hierarquias de classes
*/

abstract class Presidenciavel {
  void participarEleicao();
}

abstract class Jornalismo {
  void escreverArtigoJornal();
}

mixin Escrita {
  
  void escreverArtigoJornal(){
    print("Escrever um artigo para o Jornal");
  }
  
}

abstract class Cidadao {
  void direitosDeveres(){
    print("Todo cidadão tem direitos e deveres");
  }
}

class Obama extends Cidadao 
  implements Presidenciavel, Jornalismo  {
  
  @override
  void escreverArtigoJornal(){
    print("Escrever artigo Jornal");
  }
  
  @override
  void participarEleicao(){
    print("Eleição nos Estados Unidos para o Obama");
  } 
  
}

class Jamilton extends Cidadao with Escrita {
  
}

void main() {
	
  Obama obama = Obama();
  obama.direitosDeveres();
  obama.participarEleicao();
  
  Jamilton jamilton = Jamilton();
  jamilton.direitosDeveres();
  jamilton.escreverArtigoJornal();
  
  
}