import 'package:flutter/material.dart';
import '../services/transacao_service.dart';

class TransacaoForm extends StatefulWidget {
  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();

  void _submitForm() async {
    String nome = _nomeController.text;
    String valor = _valorController.text;

    if (nome.isNotEmpty && valor.isNotEmpty) {
      var service = TransacaoService();
      await service.createTransacao(nome, valor);

      _nomeController.clear();
      _valorController.clear();

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransacaoListPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova Transação')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _valorController,
              decoration: InputDecoration(labelText: 'Valor'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Adicionar Transação'),
            ),
          ],
        ),
      ),
    );
  }
}
