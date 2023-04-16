
import 'package:mobx/mobx.dart';

part 'pessoa_mobx.g.dart';

class PessoaMobx = PessoaMobxBase with _$PessoaMobx; //  PessoaMobxBase é uima classe abstrata que 
//tem um estrutura do 
//Mobx para que seja possível ter variáveis observáveis e ter
// uma açao para que seja possível ser obervado do widgetObserver e rebuildar quando for necessário

abstract class PessoaMobxBase with Store {
  @observable // anotação para que sejam observadas as alterações na variável.
  String apelido = 'Jão';
   
   @action // 
   void trocarApelido(String novoApelido){
    apelido = novoApelido;
   }

}

