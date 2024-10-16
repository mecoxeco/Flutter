import 'package:flutter/material.dart';
import '../services/transacao.dart';
import 'transacao_form_screen.dart';

class TransacaoListScreen extends StatefulWidget {
  @override
  _TransacaoListScreenState createState() => _TransacaoListScreenState();
}

class _TransacaoListScreenState extends State<TransacaoListScreen> {
  final TransacaoService _transacaoService = TransacaoService();
  List<dynamic> _transacoes = [];

  @override
  void initState() {
    super.initState();
    _loadTransacoes();
  }

  Future<void> _loadTransacoes() async {
    final response = await _transacaoService.getAll();
    setState(() {
      _transacoes =
          jsonDecode(response); // Assumindo que a resposta é uma lista JSON.
    });
  }

  void _deleteTransacao(String id) async {
    await _transacaoService.deleteById(id);
    _loadTransacoes(); // Recarrega a lista após deletar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transações'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        TransacaoFormScreen(onSave: _loadTransacoes)),
              );
            },
          )
        ],
      ),
      body: _transacoes.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _transacoes.length,
              itemBuilder: (context, index) {
                final transacao = _transacoes[index];
                return ListTile(
                  title: Text(transacao['nome']),
                  subtitle: Text('Valor: ${transacao['valor']}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTransacao(transacao['id']),
                  ),
                );
              },
            ),
    );
  }
}
