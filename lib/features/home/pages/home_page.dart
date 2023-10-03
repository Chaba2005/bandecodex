import 'package:flutter/material.dart';
import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/cadastro/cadastro_page.dart';
import 'package:bandecodex/features/home/pages/widgets/cardapio_item.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  final ICardapioRepository repository;
  final List<Cardapio> cardapios;

  HomePage({Key? key, required this.cardapios, required this.repository})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bandecodex",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CadastroPage(
              repository: widget.repository,
            );
          },
        )),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          itemCount: widget.cardapios.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                child: CardapioItem(
              item: widget.cardapios[index],
              repository: widget.repository,
            ));
          },
        ),
      ),
    );
  }
}
