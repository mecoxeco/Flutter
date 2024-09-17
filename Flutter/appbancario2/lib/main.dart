import 'package:appcontabancaria/screens/form_transacoes.dart';
import 'package:flutter/material.dart';

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
      home: FormTransacoes(),
    );;
  }
}
