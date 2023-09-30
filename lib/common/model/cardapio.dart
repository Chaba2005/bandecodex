// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Cardapio {
  DateTime data;
  String principal;
  String guarnicao;
  String salada;
  String sobremesa;
  String suco;
  int periodo;
  int vegetariano;

  Cardapio(
      {required this.data,
      required this.principal,
      required this.guarnicao,
      required this.salada,
      required this.sobremesa,
      required this.suco,
      required this.periodo,
      required this.vegetariano});

  factory Cardapio.fromMap(dynamic map) {
    return Cardapio(
        data: DateTime.parse(map["data"]),
        principal: map["principal"] ?? "",
        guarnicao: map["guarnicao"] ?? "",
        salada: map["salada"] ?? "",
        sobremesa: map["sobremesa"] ?? "",
        suco: map["suco"] ?? "",
        periodo: map["periodo"] ?? 0,
        vegetariano: map["vegetariano"] ?? 0);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.millisecondsSinceEpoch,
      'principal': principal,
      'guarnicao': guarnicao,
      'salada': salada,
      'sobremesa': sobremesa,
      'suco': suco,
      'periodo': periodo,
      'vegetariano': vegetariano,
    };
  }

  String toJson() => json.encode(toMap());

  factory Cardapio.fromJson(String source) => Cardapio.fromMap(json.decode(source) as Map<String, dynamic>);
}
