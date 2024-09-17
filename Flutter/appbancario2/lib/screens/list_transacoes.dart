import 'package:flutter/material.dart';
import '../components/card_list.dart';
import '../models/enums/tipo_transacao.dart';
import '../models/transacao.dart';

class ListTransacoes extends StatefulWidget {

  final List<Transacao> _transacoes = [
    Transacao(250.99, TipoTransacao.credito),
    Transacao(55.22, TipoTransacao.debito),
  ];

  ListTransacoes({super.key});

  @override
  State<ListTransacoes> createState() => _ListTransacoesState();
}

class _ListTransacoesState extends State<ListTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Transações'),
      ),
      body: ListView.builder(
        itemCount: widget._transacoes.length,
        itemBuilder: (context, indice) {

          var valor = widget._transacoes[indice].valor.toString();
          var tipo = widget._transacoes[indice].tipoTransacao.toString();

          return CardList(valor, tipo);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){}),
    );;
  }
}
