// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_import
import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Cardapio {
  int? codigo;
  DateTime data;
  String principal;
  String guarnicao;
  String salada;
  String sobremesa;
  String suco;
  int periodo;
  int vegetariano;

  Cardapio(
      {
      this.codigo,
      required this.data,
      required this.principal,
      required this.guarnicao,
      required this.salada,
      required this.sobremesa,
      required this.suco,
      required this.periodo,
      required this.vegetariano});

  factory Cardapio.fromMap(dynamic map) {
    return Cardapio(
        codigo: map["codigo"] ?? 0,
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
      'codigo': codigo,
      'data': DateFormat('yyyy-MM-dd').format(DateTime.parse(data.toString())),
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

  factory Cardapio.fromJson(String source) =>
      Cardapio.fromMap(json.decode(source) as Map<String, dynamic>);
}
