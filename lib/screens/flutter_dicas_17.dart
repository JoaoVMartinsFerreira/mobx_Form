import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_form/controllers/pessoa_mobx.dart';

class FlutterDicas17 extends StatefulWidget {
  const FlutterDicas17({super.key});
  
  @override
  State<FlutterDicas17> createState() => _FlutterDicas17State();
}
class _FlutterDicas17State extends State<FlutterDicas17> {

  final pessoa = PessoaMobx();
  final apelidoTEC = TextEditingController(); //para conseguir ter acesso ao input. Pegar o valor que será escrito no campo
  final formKey = GlobalKey<FormState>(); // é responsável por validar o formulário.

  void _submitForm(){
    if(formKey.currentState!.validate()){ // Só entra na condição se o campo for preenchido
    pessoa.trocarApelido(apelidoTEC.text); // .text para acessar o conteúdo da variável apelidoEC
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scafold usado para criar telas
    appBar: AppBar(
      title: const Text('Flutter Dicas 17 Mobx State Managment e Forms'),
    ),
    body: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Observer(builder: (_){ // Observer é reconstruído toda vez que a variáevl em questão for alterada
              return Text('Meu apelido é : ${pessoa.apelido}', 
              style: const TextStyle(fontSize: 40),);
            }),
            TextFormField(
              controller: apelidoTEC,
              validator: (String? apelido){
                if(apelido == null || apelido.isEmpty){
                  return "Você precisa colocar um apelido antes";
                }
                return null; // Retornar null mostra que todas as confições do formulário foram atendidas
              }
            ),
            ElevatedButton(
              onPressed: _submitForm, 
              child: const Text('Trocar Apelido'),
              )
          ],
        ),
      ),
    ),
    );
  }
}
