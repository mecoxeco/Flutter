import 'package:flutter/material.dart';
import 'package:provaapp/components/formulario_conta.dart';

void main() {
  runApp(const AppBancaria());
}

class AppBancaria extends StatelessWidget {
  const AppBancaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FormularioConta(),
    );
  }
}
