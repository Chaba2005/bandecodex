import 'package:flutter/material.dart';
import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/pages/cadastro/cadastro_page.dart';
import 'package:bandecodex/features/home/pages/widgets/cardapio_item.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final List<Cardapio> cardapios;

  HomePage({Key? key, required this.cardapios})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _dateController = TextEditingController();
  String fon = "";
  late List<Cardapio> busca;

  @override
  void initState() {
    // TODO: implement initState
    busca = List.from(widget.cardapios);
    super.initState();
  }

  void atualizaLista(String nome) {
  setState(() {
    // Filtra a lista com base na data
    busca = widget.cardapios.where((element) => (element.principal.toLowerCase().contains(nome.toLowerCase()))).toList();
    print(busca);
  });
}
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

            );
          },
        )),
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 250,
                    child: TextField(
                      onChanged: (value) {
                        fon = value;
                        atualizaLista(value);
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        labelText: 'Principal',
                        border: OutlineInputBorder(),
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                )
              ]
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: busca.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: CardapioItem(
                    item: busca[index],
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}


