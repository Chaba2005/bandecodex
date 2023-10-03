import 'package:bandecodex/features/home/pages/home_error.dart';
import 'package:bandecodex/features/home/pages/home_loading.dart';
import 'package:bandecodex/features/home/pages/home_page.dart';
import 'package:bandecodex/features/repository/cardapio_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final ICardapioRepository repository = CardapioRepository(dio: Dio());
  HomeContainer({super.key,});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.getAllCardapios(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return HomePage(cardapios: snapshot.data!, repository: repository,);
        }

        if (snapshot.hasError) {
          return HomeError(error: snapshot.error.toString());
        }
        return Container();
      },
    );
  }
}
