import 'package:controle_combustivel/views/cadastro_abastecimento_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('Abastecimentos'),
      ),
      body: Container(
        child: Text('Conteúdo aqui'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCadastroAbastecimento(context);
        },
        child: Icon(Icons.add),
//        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  void _showCadastroAbastecimento(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => CadastroAbastecimentoPage()));
  }
}
