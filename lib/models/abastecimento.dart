import 'package:flutter/material.dart';

class Abastecimento {
  final String combustivel;
  final double valorPago;
  final double precoLitro;
  final double quantidadeLitros;
  final double quilometragem;

  Abastecimento({
    @required this.combustivel,
    @required this.valorPago,
    @required this.precoLitro,
    @required this.quantidadeLitros,
    @required this.quilometragem,
  });

  Map<String, dynamic> toMap() {
    return {
      'combustivel': combustivel,
      'valorPago': valorPago,
      'precoLitro': precoLitro,
      'quantidadeLitros': quantidadeLitros,
      'quilometragem': quilometragem
    };
  }

  static Abastecimento fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Abastecimento(
        combustivel: map['combustivel'],
        valorPago: map['valorPago'],
        precoLitro: map['precoLitro'],
        quantidadeLitros: map['quantidadeLitros'],
        quilometragem: map['quilometragem']);
  }

  @override
  String toString() {
    return 'Abastecimento{combustivel: $combustivel, valorPago: $valorPago, precoLitro: $precoLitro, quantidadeLitros: $quantidadeLitros, quilometragem: $quilometragem}';
  }
}
