import 'package:flutter/material.dart';
import '../services/transacao_service.dart';

class TransacaoFormScreen extends StatefulWidget {
  final VoidCallback onSave;

  TransacaoFormScreen({required this.onSave});

  @override
  _TransacaoFormScreenState createState() => _TransacaoFormScreenState();
}

class _TransacaoFormScreenState extends State<TransacaoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nomeController = TextEditingController();
  final _valorController = TextEditingController();
  final TransacaoService _transacaoService = TransacaoService();

  void _createTransacao() async {
    if (_formKey.currentState!.validate()) {
      await _transacaoService.createTransacao(
        _idController.text,
        _nomeController.text,
        _valorController.text,
      );
      widget.onSave(); // Chama o callback para recarregar a lista
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorController,
                decoration: InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira o valor';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createTransacao,
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}