import 'package:flutter/material.dart';
import 'package:teste/models/enums/tipo_transacao.dart';
import 'package:teste/models/transacao.dart';

class FormTransacoes extends StatefulWidget {
  final TextEditingController _ctrlvalor = TextEditingController();

  FormTransacoes({super.key});

  @override
  State<FormTransacoes> createState() => _FormTransacoesState();
}

class _FormTransacoesState extends State<FormTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Transações'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget._ctrlvalor,
                style: const TextStyle(fontSize: 24),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _criarTransacoes(context);
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransacoes(BuildContext context){
    double? valor = double.tryParse(widget._ctrlvalor.text);

    if(valor != null){
      final novaTransacao = Transacao(valor, TipoTransacao.credito);
      Navigator.pop(context, novaTransacao);
    }
  }
}
