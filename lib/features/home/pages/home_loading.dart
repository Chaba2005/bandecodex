import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 400,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 200, child: Image.asset('assets/comida.png')),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: LinearProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
