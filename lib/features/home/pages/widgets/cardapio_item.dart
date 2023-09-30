import 'package:bandecodex/common/model/cardapio.dart';
import 'package:flutter/material.dart';

class CardapioItem extends StatelessWidget {
  final Cardapio item;

  CardapioItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5), // Cor da sombra
          spreadRadius: 5, // Espalhamento da sombra
          blurRadius: 7, // Desfoque da sombra
          offset: Offset(0, 3), // Deslocamento da sombra (horizontal, vertical)
        ),
      ],
      ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(item.guarnicao),
            SizedBox(
              height: 50, 
              child: Image.asset('assets/comida.png'),
            )
          ],
        ),
      ),
    );
  }
}
