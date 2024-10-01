import 'package:flutter/material.dart';

class ContaBancaria<T> {
  final String tipoConta;
  final T saldo;

  ContaBancaria({required this.tipoConta, required this.saldo});

  String mostrarSaldo() {
    return 'Saldo: $saldo';
  }
}

class CardMini extends StatelessWidget {
  const CardMini({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        _buildCard(
          ContaBancaria<String>(tipoConta: 'Conta corrente', saldo: 'R\$ 100,00'),
        ),
        _buildCard(
          ContaBancaria<String>(tipoConta: 'Conta poupança', saldo: 'R\$ 10.000,00'), 
        ),
        _buildCard(
          ContaBancaria<int>(tipoConta: 'Investimentos', saldo: 50000),
        ),
      ],
    );
  }

  Widget _buildCard(ContaBancaria conta) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.account_balance_wallet),
        title: Text(conta.tipoConta),
        subtitle: Text(conta.mostrarSaldo()),
      ),
    );
  }
}
