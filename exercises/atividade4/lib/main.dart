import 'package:flutter/material.dart';
import 'package:teste/screens/list_transacoes.dart';

void main() {
  runApp(Mybank());
}

class Mybank extends StatelessWidget {
  const Mybank({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent[700],
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blueAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: ListTransacoes(),
    );
  }
}
