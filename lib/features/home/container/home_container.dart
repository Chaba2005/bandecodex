import 'package:bandecodex/features/home/pages/home_error.dart';
import 'package:bandecodex/features/home/pages/home_loading.dart';
import 'package:bandecodex/features/home/pages/home_page.dart';
import 'package:bandecodex/features/repository/cardapio_provider.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContainer extends StatelessWidget {
  late CardapioProvider repository;
  HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    repository = context.watch<CardapioProvider>();
    return FutureBuilder(
      future: repository.getAllCardapios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return HomePage(
            cardapios: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        }
        return Container();
      },
    );
  }
}
