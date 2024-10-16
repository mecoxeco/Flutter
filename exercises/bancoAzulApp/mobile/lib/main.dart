import 'package:flutter/material.dart';
import 'screens/transacao_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransacaoListScreen(),
    );
  }
}