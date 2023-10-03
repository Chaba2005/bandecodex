import 'package:bandecodex/env/api_consts.dart';
import 'package:dio/dio.dart';
import '../../common/model/cardapio.dart';

abstract class ICardapioRepository {
  Future<List<Cardapio>> getAllCardapios();
  Future<void> createCardapio(Cardapio item);
  Future<void> updateCardapio(Cardapio item);
  Future<void> deleteCardapio(Cardapio item);
}

class CardapioRepository implements ICardapioRepository {
  final Dio dio;

  CardapioRepository({required this.dio});

  @override
  Future<List<Cardapio>> getAllCardapios() async {
    try {
      final response = await dio.get(ApiConsts.allCardapioUrl);
      if (response.statusCode == 200) {
        final cardapios = response.data as List<dynamic>;
        final result = cardapios.map((e) => Cardapio.fromMap(e)).toList();
        print(result.first.toMap());
        return result;
      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Não foi possível carregar os cardápios: $e');
    }
  }

  @override
  Future<void> createCardapio(Cardapio item) async {
    try {
      final response = await dio.post(
        ApiConsts.createCardapioUrl,
        data: item.toMap(),
      );
      if (response.statusCode == 200) {
        print('Cardápio criado com sucesso!');
      } else {
        throw Exception('Erro ao criar o cardápio: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Não foi possível cadastrar o cardápio: $e');
    }
  }

  Future<void> updateCardapio(Cardapio item) async {
    try {
      final response =
          await dio.put(ApiConsts.createCardapioUrl, data: item.toMap());
      if (response.statusCode == 200)
        print('Cardápio alterado com sucesso!');
      else {
        throw Exception('Erro ao alterar cardápio: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Não foi possível alterar o cardápio: $e');
    }
  }

  Future<void> deleteCardapio(Cardapio item) async {
    print(item.codigo);
    try {
      final response =
          await dio.delete(ApiConsts.createCardapioUrl, data: item.toMap());
      if (response.statusCode == 200)
        print('Cardápio deletado com sucesso!');
      else {
        throw Exception('Erro ao deletar cardápio: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Não foi possível deletar o cardápio: $e');
    }
  }
}
