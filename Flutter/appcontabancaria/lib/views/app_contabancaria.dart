import 'package:appcontabancaria/views/home.dart';
import 'package:flutter/material.dart';

class AppContabancaria extends StatelessWidget {
  const AppContabancaria({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
      ),
      home: const Home(),
    );
  }
}
