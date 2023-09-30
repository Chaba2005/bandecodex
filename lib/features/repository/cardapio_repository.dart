import 'dart:convert';

import 'package:bandecodex/env/api_consts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/model/cardapio.dart';

abstract class ICardapioRepository {
  Future<List<Cardapio>> getAllCardapios();
}

class CardapioRepository implements ICardapioRepository {
  final Dio dio;

  CardapioRepository({required this.dio});

  Future<List<Cardapio>> getAllCardapios() async {
    try {
      final response = await dio.get(ApiConsts.allCardapioUrl);
      final cardapios = response.data as List<dynamic>;
      final result = cardapios.map((e) => Cardapio.fromMap(e)).toList();

      return result;
    } catch (e) {
      throw Exception('Não foi possível carregar os cardápios');
    }
  }
}
