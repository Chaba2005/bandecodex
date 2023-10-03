import 'package:bandecodex/features/home/container/home_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/edit/edit_page.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';

class CardapioItem extends StatefulWidget {
  final ICardapioRepository repository;
  final Cardapio item;

  CardapioItem({Key? key, required this.item, required this.repository})
      : super(key: key);

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
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
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
                            PopupMenuButton(itemBuilder: (context) {
                                return [
                                  PopupMenuItem(child: Text('Edit'),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                                        return EditPage(repository: widget.repository, cardapio: widget.item);
                                      },));
                                    },
                                  ),
                                  PopupMenuItem(child: Text('Delete'),
                                  onTap: (){
                                    widget.repository.deleteCardapio(widget.item).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                      return HomeContainer();
                                    },)) );
                                  },
                                  ),
                                ];
                              },),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Data
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Data:',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(DateFormat('dd/MM/yy').format(widget.item.data)),
                                  ),
                                ],
                              ),
                              //Prato principal
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Prato principal :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.principal),
                                  ),
                                ],
                              ),
                              //Guarnição
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Guarnição :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.guarnicao),
                                  ),
                                ],
                              ),
                              //Salada
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Salada :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.salada),
                                  ),
                                ],
                              ),
                              //Sobremesa
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Sobremesa :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.sobremesa),
                                  ),
                                ],
                              ),
                              //Suco
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Suco :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.suco),
                                  ),
                                ],
                              ),
                              //Período
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Período :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.periodo == 0 ? "Almoço" : "Janta"),
                                  ),
                                ],
                              ),
                              //Vegetariano
                              Row(
                                children: [
                                  const ContainerHead(
                                    text: 'Vegetariano :',
                                  ),
                                  const SizedBox(width: 50,),
                                  Container(
                                    child: Text(widget.item.vegetariano == 0 ? "Vegetariano" : "Não vegetariano"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
            ;
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

  void showCardapioBottomSheet(BuildContext context, Cardapio cardapio) {}
  
}

class ContainerHead extends StatelessWidget {
  final text;
  const ContainerHead({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *0.3,
      child: Text(text,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
    );
  }
}

