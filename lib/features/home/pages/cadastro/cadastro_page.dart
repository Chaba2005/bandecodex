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

class CadastroPage extends StatefulWidget {
  CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  late CardapioProvider repository;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _principalController = TextEditingController();
  TextEditingController _guarnicaoController = TextEditingController();
  TextEditingController _saladaController = TextEditingController();
  TextEditingController _sobremesaController = TextEditingController();
  TextEditingController _sucoController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int selectedPeriodo = 0; // Opções de período
  int selectedVegetariano = 1;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  } // Opções vegetarianas

  @override
  Widget build(BuildContext context) {
    repository = context.watch<CardapioProvider>();
    DateTime date = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: Text("Cadastro e alteração",
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
              child: Form(
                key: formKey,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _guarnicaoController,
                      decoration: const InputDecoration(
                          labelText: 'Guarnição: ',
                          prefixIcon: Icon(Icons.restaurant),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _saladaController,
                      decoration: const InputDecoration(
                          labelText: 'Salada: ',
                          prefixIcon: Icon(Icons.restaurant),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _sobremesaController,
                      decoration: const InputDecoration(
                          labelText: 'Sobremesa: ',
                          prefixIcon: Icon(Icons.restaurant),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _sucoController,
                      decoration: const InputDecoration(
                          labelText: 'Suco: ',
                          prefixIcon: Icon(Icons.restaurant),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obrigatório";
                        } else {
                          return null;
                        }
                      },
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
                        isSelected: [
                          selectedPeriodo == 0,
                          selectedPeriodo == 1
                        ],
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
                            child: Center(child: Icon(Icons.restaurant)),
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
                          if (formKey.currentState!.validate()) {
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
                            repository.createCardapio(item);
                            Navigator.pop(context);
                            _dateController.clear();
                            _principalController.clear();
                            _saladaController.clear();
                            _sucoController.clear();
                            _guarnicaoController.clear();
                            _sobremesaController.clear();
                          }
                        },
                        child: Container(
                            width: 120,
                            height: 40,
                            child: Center(
                                child: Text(
                              'Cadastrar',
                              style: TextStyle(fontSize: 16),
                            ))))
                  ],
                ),
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
