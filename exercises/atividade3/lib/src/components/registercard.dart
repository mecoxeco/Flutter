import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Digite o seu Nome Completo'),
            subtitle: TextField(
              decoration: const InputDecoration(
                hintText: 'Nome Completo',
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.savings),
            title: const Text('Digite o seu CPF'),
            subtitle: TextField(
              decoration: const InputDecoration(
                hintText: 'CPF',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Digite a sua Senha'),
            subtitle: TextField(
              decoration: const InputDecoration(
                hintText: 'Senha',
              ),
              obscureText: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Cadastro realizado com sucesso!'),
                ),
              );
            },
            child: const Text('Cadastrar'),
          ),
        ),
      ],
    );
  }
}
