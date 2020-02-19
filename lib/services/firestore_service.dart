import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_combustivel/models/abastecimento.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FirestoreService {
  final CollectionReference _abastecimentoCollectionReference =
      Firestore.instance.collection('abastecimento');

  Future adicionaAbastecimento(Abastecimento abastecimento) async {
    try {
      return await _abastecimentoCollectionReference.add(abastecimento.toMap());
    } catch (e) {
      debugPrint(e.toString());
      if (e is PlatformException) return e.message;
      return e.toString();
    }
  }

  Future<List<Abastecimento>> obtemAbastecimentos() async {
    return (await _abastecimentoCollectionReference.getDocuments())
        .documents
        .map((snapshot) => Abastecimento.fromMap(snapshot.data))
        .where((snapshot) => snapshot.valorPago != null)
        .toList();
  }
}
