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
      body: Center(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    filled: true,
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () {
                    _selectDate();
                  },
                ),
                TextFormField(
                  controller: _principalController,
                ),
                TextFormField(
                  controller: _guarnicaoController,
                ),
                TextFormField(
                  controller: _saladaController,
                ),
                TextFormField(
                  controller: _sobremesaController,
                ),
                TextFormField(
                  controller: _sucoController,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        child: Center(child: Text('Almoço')),
                      ),
                      SizedBox(
                        width: 80,
                        child: Center(child: Text('Janta')),
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
                      SizedBox(
                        width: 80,
                        child: Center(child: Text('Comum')),
                      ),
                      SizedBox(
                        width: 80,
                        child: Center(child: Text('Vegetariano')),
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
                ElevatedButton(
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
                    },
                    child: Text('Cadastrar'))
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
