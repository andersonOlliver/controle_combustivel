import 'package:flutter/material.dart';

class Abastecimento {
  final double valorPago;
  final double precoLitro;
  final double quantidadeLitros;
  final double quilometragem;

  Abastecimento({
    @required this.valorPago,
    @required this.precoLitro,
    @required this.quantidadeLitros,
    @required this.quilometragem,
  });

  Map<String, dynamic> toMap() {
    return {
      'valorPago': valorPago,
      'precoLitro': precoLitro,
      'quantidadeLitros': quantidadeLitros,
      'quilometragem': quilometragem
    };
  }

  static Abastecimento fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Abastecimento(
        valorPago: map['valorPago'],
        precoLitro: map['precoLitro'],
        quantidadeLitros: map['quantidadeLitros'],
        quilometragem: map['quilometragem']);
  }
}
