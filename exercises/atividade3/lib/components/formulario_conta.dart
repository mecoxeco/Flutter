import 'package:flutter/material.dart';

class FormularioConta extends StatefulWidget {
  const FormularioConta({super.key});

  @override
  _FormularioContaState createState() => _FormularioContaState();
}

class _FormularioContaState extends State<FormularioConta> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _contas = [];

  final _nomeController = TextEditingController();
  final _cpfController = TextEditingController();
  final _saldoController = TextEditingController();

  void _adicionarConta() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _contas.add({
          'nome': _nomeController.text,
          'cpf': _cpfController.text,
          'saldo': _saldoController.text,
        });
        _nomeController.clear();
        _cpfController.clear();
        _saldoController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Formulário para adicionar contas
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _cpfController,
                    decoration: const InputDecoration(labelText: 'CPF'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o CPF';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _saldoController,
                    decoration: const InputDecoration(labelText: 'Saldo'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o saldo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _adicionarConta,
                    child: const Text('Adicionar Conta'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contas adicionadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              // ListView dinâmico para exibir as contas
              child: ListView.builder(
                itemCount: _contas.length,
                itemBuilder: (context, index) {
                  final conta = _contas[index];
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.account_balance_wallet),
                      title: Text('Nome: ${conta['nome']}'),
                      subtitle: Text('CPF: ${conta['cpf']} - Saldo: R\$ ${conta['saldo']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
