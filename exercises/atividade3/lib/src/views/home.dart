import 'package:flutter/material.dart';
import '../components/accountcard.dart';
import '../components/registercard.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: const AccountCard(), 
          ),
          Expanded(
            flex: 3,
            child: const RegisterForm(), 
          ),
        ],
      ),
    );
  }
}
