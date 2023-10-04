// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:bandecodex/common/model/cardapio.dart';
import 'package:bandecodex/features/home/container/home_container.dart';
import 'package:bandecodex/features/repository/cardapio_provider.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  final Cardapio cardapio;
  const EditPage({super.key, required this.cardapio});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  late CardapioProvider repository;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _principalController = TextEditingController();
  TextEditingController _guarnicaoController = TextEditingController();
  TextEditingController _saladaController = TextEditingController();
  TextEditingController _sobremesaController = TextEditingController();
  TextEditingController _sucoController = TextEditingController();
  int selectedPeriodo = 0; // Opções de período
  int selectedVegetariano = 1; // Opções vegetarianas

  @override
  void initState() {
    // TODO: implement initState

    _dateController.text =
        DateFormat('yyyy-MM-dd').format(widget.cardapio.data);
    _principalController.text = widget.cardapio.principal;
    _guarnicaoController.text = widget.cardapio.guarnicao;
    _saladaController.text = widget.cardapio.salada;
    _sobremesaController.text = widget.cardapio.sobremesa;
    _sucoController.text = widget.cardapio.suco;
    selectedPeriodo = widget.cardapio.periodo;
    selectedVegetariano = widget.cardapio.vegetariano;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    repository = context.watch<CardapioProvider>();
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: Text("Cadastro de cardápios",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(8)))),
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
                        )),
                  ),
                  TextFormField(
                    controller: _guarnicaoController,
                    decoration: const InputDecoration(
                        labelText: 'Guarnição: ',
                        prefixIcon: Icon(Icons.restaurant),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  TextFormField(
                    controller: _saladaController,
                    decoration: const InputDecoration(
                        labelText: 'Salada: ',
                        prefixIcon: Icon(Icons.restaurant),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  TextFormField(
                    controller: _sobremesaController,
                    decoration: const InputDecoration(
                        labelText: 'Sobremesa: ',
                        prefixIcon: Icon(Icons.restaurant),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  TextFormField(
                    controller: _sucoController,
                    decoration: const InputDecoration(
                        labelText: 'Suco: ',
                        prefixIcon: Icon(Icons.restaurant),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ToggleButtons(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Center(
                            child: Icon(Icons.sunny),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          child: Center(child: Icon(Icons.nightlight)),
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
                    padding: const EdgeInsets.all(4.0),
                    child: ToggleButtons(
                      children: const [
                        SizedBox(
                          width: 80,
                          child: Center(child: Icon(Icons.restaurant_menu)),
                        ),
                        SizedBox(
                          width: 80,
                          child: Center(child: Icon(Icons.eco)),
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
                  FilledButton(
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        print(_dateController.text);
                        Cardapio item = Cardapio(
                            codigo: widget.cardapio.codigo,
                            data: DateTime.parse(_dateController.text),
                            periodo: selectedPeriodo,
                            vegetariano: selectedVegetariano,
                            principal: _principalController.text,
                            salada: _saladaController.text,
                            suco: _sucoController.text,
                            guarnicao: _guarnicaoController.text,
                            sobremesa: _sobremesaController.text);
                        repository.updateCardapio(item);
                        Navigator.pop(context);
                        _dateController.clear();
                        _principalController.clear();
                        _saladaController.clear();
                        _sucoController.clear();
                        _guarnicaoController.clear();
                        _sobremesaController.clear();
                      },
                      child: Container(
                          width: 120,
                          height: 40,
                          child: Center(
                              child: Text(
                            'Alterar',
                            style: TextStyle(fontSize: 16),
                          ))))
                ],
              ),
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
