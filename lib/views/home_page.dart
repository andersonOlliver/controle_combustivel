import 'package:controle_combustivel/components/progress.dart';
import 'package:controle_combustivel/models/abastecimento.dart';
import 'package:controle_combustivel/services/firestore_service.dart';
import 'package:controle_combustivel/views/cadastro_abastecimento_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('Abastecimentos'),
      ),
      body: FutureBuilder<List<Abastecimento>>(
        initialData: List(),
        future: _firestoreService.obtemAbastecimentos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Abastecimento> abastecimentos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: Text(
                    abastecimentos[index].combustivel.substring(0, 1),
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  title: Text(abastecimentos[index].combustivel),
                  subtitle: Text(
                      '${abastecimentos[index].quantidadeLitros}L - R\$ ${abastecimentos[index].precoLitro}'),
                  trailing: Text('R\$ ${abastecimentos[index].valorPago}'),
                ),
                itemCount: abastecimentos.length,
              );
              break;
          }
          return Text('Unknown error');
        },
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

  void _showCadastroAbastecimento(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CadastroAbastecimentoPage()));
  }
}
