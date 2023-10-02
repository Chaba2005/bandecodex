import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/edit/edit_page.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';

class CardapioItem extends StatefulWidget {

  final Cardapio item;

  CardapioItem({Key? key, required this.item}) : super(key: key);

  @override
  _CardapioItemState createState() => _CardapioItemState();
}

class _CardapioItemState extends State<CardapioItem> {

  
  @override
  Widget build(BuildContext context) {
    // O código da construção do widget permanece o mesmo
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return EditPage(
                              repository: CardapioRepository(dio: Dio()),
                              cardapio: widget.item,
                            );
                          },
                        ));
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  ],
                ),
                Row(
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
                          child: Text(widget.item.data.toString()),
                        ),
                        Container(
                          child: Text(widget.item.principal),
                        ),
                        Container(
                          child: Text(widget.item.guarnicao),
                        ),
                        Container(
                          child: Text(widget.item.salada),
                        ),
                        Container(
                          child: Text(widget.item.sobremesa),
                        ),
                        Container(
                          child: Text(widget.item.suco),
                        ),
                        Container(
                          child: Text(widget.item.periodo.toString()),
                        ),
                        Container(
                          child: Text(widget.item.vegetariano.toString()),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );;
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.25,
                  child: Center(
                    child: Image.asset(
                      'assets/fotoComida.png',
                      height: 140,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Icon(Icons.restaurant),
                              Text(
                                "Cardápio de ${DateFormat('dd/MM/yy').format(widget.item.data)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Text(widget.item.vegetariano == 0
                              ? "Vegetariano"
                              : "Não vegetariano"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Clique para ver mais",
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
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
    
  }
}
