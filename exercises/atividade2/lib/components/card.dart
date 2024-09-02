import 'package:flutter/material.dart';

class CardMini extends StatelessWidget {
  const CardMini({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Card(
          child: ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('Conta corrente'),
            subtitle: const Text('Saldo: R\$ 100,00'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.savings),
            title: const Text('Conta poupança'),
            subtitle: const Text('Saldo: R\$ 10.000,00'),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.trending_up),
            title: const Text('Investimentos'),
            subtitle: const Text('Saldo: R\$ 50.000,00'),
          ),
        ),
      ],
    );
  }
}
