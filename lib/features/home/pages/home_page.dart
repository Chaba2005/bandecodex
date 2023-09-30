import 'package:bandecodex/common/model/cardapio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Cardapio> cardapios;

  HomePage({Key? key, required this.cardapios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cardapios.length,
        itemBuilder: (BuildContext context, int index) {
          // Corrigido: Retornar o widget Text
          return ListTile(
            title: Text(cardapios[index].guarnicao),
          );
        },
      ),
    );
  }
}
