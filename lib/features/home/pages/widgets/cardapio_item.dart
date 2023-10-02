import 'package:bandecodex/common/model/cardapio.dart';
import 'package:flutter/material.dart';

class CardapioItem extends StatelessWidget {
  final Cardapio item;

  CardapioItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5, // Elevação para dar a sensação de clique
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            // Ação a ser executada quando o CardapioItem é pressionado.
            showCardapioBottomSheet(context, item);
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.restaurant),
                      Text("Cardápio de ${item.data.day}/${item.data.month}/${item.data.year}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
                    ],
                  ),
                  Text(item.vegetariano == 0 ? "Vegetariano" : "Não vegetariano"),
                  Center(child: Image.asset('assets/fotoComida.png', height: 140,)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Clique para ver mais", style: TextStyle(fontStyle: FontStyle.italic),)
                    ],
                  )
                ],
              ),
            ),  
          )
        ),
      ),
    );
  }

  void showCardapioBottomSheet(BuildContext context, Cardapio cardapio) {
    showModalBottomSheet(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Data: '),
                    ),
                    Container(
                      child: Text('Principal: '),
                    ),
                    Container(
                      child: Text('Guarnição:'),
                    ),
                    Container(
                      child: Text('Salada: '),
                    ),
                    Container(
                      child: Text('Sobremesa: '),
                    ),
                    Container(
                      child: Text('Suco: '),
                    ),
                    Container(
                      child: Text('Período: '),
                    ),
                    Container(
                      child: Text('Vegetariano:'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(cardapio.data.toString()),
                    ),
                    Container(
                      child: Text(cardapio.principal),
                    ),
                    Container(
                      child: Text(cardapio.guarnicao),
                    ),
                    Container(
                      child: Text(cardapio.salada),
                    ),
                    Container(
                      child: Text(cardapio.sobremesa),
                    ),
                    Container(
                      child: Text(cardapio.suco),
                    ),
                    Container(
                      child: Text(cardapio.periodo.toString()),
                    ),
                    Container(
                      child: Text(cardapio.vegetariano.toString()),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
