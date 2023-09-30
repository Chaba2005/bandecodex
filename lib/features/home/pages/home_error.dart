import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  String error;
  HomeError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
