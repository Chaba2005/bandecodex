// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroPage extends StatefulWidget {
  final ICardapioRepository repository;
  const CadastroPage({super.key, required this.repository});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _principalController = TextEditingController();
  TextEditingController _guarnicaoController = TextEditingController();
  TextEditingController _saladaController = TextEditingController();
  TextEditingController _sobremesaController = TextEditingController();
  TextEditingController _sucoController = TextEditingController();
  int selectedPeriodo = 0; // Opções de período
  int selectedVegetariano = 1; // Opções vegetarianas
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: Text("Cadastro de cardápios", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Data: ',
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    )
                  ),
                  onTap: () {
                    _selectDate();
                  },
                ),
                TextFormField(
                  controller: _principalController,
                  decoration: const InputDecoration(
                    labelText: 'Prato Principal: ',
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  ),
                ),
                TextFormField(
                  controller: _guarnicaoController,
                  decoration: const InputDecoration(
                    labelText: 'Guarnição: ',
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  ),
                ),
                TextFormField(
                  controller: _saladaController,
                  decoration: const InputDecoration(
                    labelText: 'Salada: ',
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  ),
                ),
                TextFormField(
                  controller: _sobremesaController,
                  decoration: const InputDecoration(
                    labelText: 'Sobremesa: ',
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  ),
                ),
                TextFormField(
                  controller: _sucoController,
                  decoration: const InputDecoration(
                    labelText: 'Suco: ',
                    prefixIcon: Icon(Icons.restaurant),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: selectedPeriodo == 0 ? Colors.red[900] : Colors.red[200]
                        ),
                        child: SizedBox(
                          width: 80,
                          child: Center(child: Text('Almoço', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: selectedPeriodo == 1 ? Colors.red[900] : Colors.red[200]
                        ),
                        child: SizedBox(
                          width: 80,
                          child: Center(child: Text('Janta', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                    isSelected: [selectedPeriodo == 0, selectedPeriodo == 1],
                    onPressed: (int index) {
                      setState(() {
                        selectedPeriodo = index;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    children: <Widget>[
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: selectedVegetariano == 0 ? Colors.red[900] : Colors.red[200]
                        ),
                        child: SizedBox(
                          width: 80,
                          child: Center(child: Text('Comum', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: selectedVegetariano == 1 ? Colors.red[900] : Colors.red[200]
                        ),
                        child: SizedBox(
                          width: 80,
                          child: Center(child: Text('Vegetariano', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                    isSelected: [
                      selectedVegetariano == 0,
                      selectedVegetariano == 1
                    ],
                    onPressed: (int index) {
                      setState(() {
                        selectedVegetariano = index;
                      });
                    },
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red[900]!)
                    ),
                    onPressed: () {
                      print(_dateController.text);
                      Cardapio item = Cardapio(
                          data: DateTime.parse(_dateController.text),
                          periodo: selectedPeriodo,
                          vegetariano: selectedVegetariano,
                          principal: _principalController.text,
                          salada: _saladaController.text,
                          suco: _sucoController.text,
                          guarnicao: _guarnicaoController.text,
                          sobremesa: _sobremesaController.text);
                      widget.repository.createCardapio(item);
                      _dateController.clear();
                      _principalController.clear();
                      _saladaController.clear();
                      _sucoController.clear();
                      _guarnicaoController.clear();
                      _sobremesaController.clear();
                      Navigator.pop(context);
                    },
                    child: Text('Cadastrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)))
              ],
            ),
          ),
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
