import 'package:controle_combustivel/models/abastecimento.dart';
import 'package:controle_combustivel/services/firestore_service.dart';
import 'package:flutter/material.dart';

class CadastroAbastecimentoPage extends StatefulWidget {
  @override
  _CadastroAbastecimentoPageState createState() =>
      _CadastroAbastecimentoPageState();
}

class _CadastroAbastecimentoPageState extends State<CadastroAbastecimentoPage> {
  final TextEditingController _valorPagoController = TextEditingController();
  final TextEditingController _precoLitroController = TextEditingController();
  final TextEditingController _quantidadeLitroController =
      TextEditingController();
  final TextEditingController _quilometragemController =
      TextEditingController();
  int combustivel = 0;
  final FirestoreService _firestoreService = FirestoreService();

  void _handleCombustivelChange(int value) {
    setState(() {
      combustivel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white30,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        title: Text(
          'Dados de abastecimento',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Combustível:',
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: combustivel,
                    onChanged: _handleCombustivelChange,
                  ),
                  Text(
                    'Álcool',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                    value: 1,
                    groupValue: combustivel,
                    onChanged: _handleCombustivelChange,
                  ),
                  new Text(
                    'Gasolina',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valorPagoController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: 'Valor pago',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _precoLitroController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: 'Preço por litro',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _quantidadeLitroController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: 'Quantidade em litros',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _quilometragemController,
                  style: TextStyle(fontSize: 16.0),
                  decoration: InputDecoration(
                    labelText: 'Quilometragem atual',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Adicionar'),
                    onPressed: () {
                      _adicionaAbastecimento();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _adicionaAbastecimento() async {
    var valorPago = _valorPagoController.text;
    var precoLitro = _precoLitroController.text;
    var qtdLitro = _quantidadeLitroController.text;
    var quilometragem = _quilometragemController.text;

    var abastecimento = Abastecimento(
        valorPago: double.parse(valorPago),
        precoLitro: double.parse(precoLitro),
        quantidadeLitros: double.parse(qtdLitro),
        quilometragem: double.parse(quilometragem));


    await _firestoreService.adicionaAbastecimento(abastecimento);
  }
}
