import 'package:flutter/material.dart';
import '../services/transacao_service.dart';
import 'formulario.dart';

class TransacaoListPage extends StatefulWidget {
  @override
  _TransacaoListPageState createState() => _TransacaoListPageState();
}

class _TransacaoListPageState extends State<TransacaoListPage> {
  List<dynamic> _transacoes = [];

  void _fetchTransacoes() async {
    var service = TransacaoService();
    String jsonResponse = await service.getAll();
    setState(() {
      _transacoes = json.decode(jsonResponse);
    });
  }

  void _deleteTransacao(String id) async {
    var service = TransacaoService();
    await service.deleteById(id);
    _fetchTransacoes();
  }

  @override
  void initState() {
    super.initState();
    _fetchTransacoes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transações'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransacaoForm()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _transacoes.length,
        itemBuilder: (context, index) {
          var transacao = _transacoes[index];
          return ListTile(
            title: Text(transacao['nome']),
            subtitle: Text(transacao['valor'].toString()),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTransacao(transacao['id'].toString()),
            ),
          );
        },
      ),
    );
  }
}
