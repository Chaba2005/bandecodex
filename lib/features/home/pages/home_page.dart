import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/cadastro/cadastro_page.dart';
import 'package:bandecodex/features/home/pages/widgets/cardapio_item.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Cardapio> cardapios;

  HomePage({Key? key, required this.cardapios}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text("Cardápios", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CadastroPage(
              repository: CardapioRepository(dio: Dio()),
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
          itemCount: cardapios.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(child: CardapioItem(item: cardapios[index]));
          },
        ),
      ),
    );
  }
}
