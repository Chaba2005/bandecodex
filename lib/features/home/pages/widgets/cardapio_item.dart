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
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title:
                    Text('Data: ${cardapio.data.day}/${cardapio.data.month}'),
              ),
              ListTile(
                title: Text('Principal: ${cardapio.principal}'),
              ),
              ListTile(
                title: Text('Guarnição:'),
                subtitle: Text(item.guarnicao),
              ),
              ListTile(
                title: Text('Salada: ${cardapio.salada}'),
              ),
              ListTile(
                title: Text('Sobremesa: ${cardapio.sobremesa}'),
              ),
              ListTile(
                title: Text('Suco: ${cardapio.suco}'),
              ),
              ListTile(
                title: Text('Período: ${cardapio.periodo}'),
              ),
              ListTile(
                title: Text(
                    'Vegetariano: ${cardapio.vegetariano == 1 ? 'Sim' : 'Não'}'),
              ),
            ],
          ),
        );
      },
    );
  }
}
