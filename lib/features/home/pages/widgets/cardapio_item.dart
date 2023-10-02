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
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    height: 100,
                    child: Opacity(
                      opacity: 0.1,
                      child: Image.asset('assets/comida.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      item.guarnicao,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '${item.data.day}/${item.data.month}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
