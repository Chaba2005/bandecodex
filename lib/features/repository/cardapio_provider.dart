import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class CardapioProvider extends ChangeNotifier {
  final ICardapioRepository _repository;

  CardapioProvider({required ICardapioRepository repository})
      : _repository = repository;

  // Métodos para acessar o repositório
  Future<List<Cardapio>> getAllCardapios() async {
    try {
      final cardapios = await _repository.getAllCardapios();
      // Notificar os ouvintes que os dados foram atualizados
      return cardapios;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createCardapio(Cardapio item) async {
    try {
      await _repository.createCardapio(item);
      // Notificar os ouvintes que os dados foram atualizados
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateCardapio(Cardapio item) async {
    try {
      await _repository.updateCardapio(item);
      // Notificar os ouvintes que os dados foram atualizados
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteCardapio(Cardapio item) async {
    try {
      await _repository.deleteCardapio(item);
      // Notificar os ouvintes que os dados foram atualizados
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
