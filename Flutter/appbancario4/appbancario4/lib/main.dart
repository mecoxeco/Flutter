import 'package:flutter/material.dart';
import 'screens/lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco Azul App',
      home: TransacaoListPage(),
    );
  }
}
