import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/widgets/cardapio_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Cardapio> cardapios;

  HomePage({Key? key, required this.cardapios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          crossAxisCount: 2, 
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
          children: cardapios.map((e) => CardapioItem(item: e)).toList(),
          ),
      )
    );
  }
}
