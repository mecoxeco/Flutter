import "dart:convert";

import "package:http/http.dart" as http;

abstract class AbstractsApi {
  final _urllocalHost = 'http://localhost:3000';

  String _recurso;

  AbstractsApi(this._recurso);

  Future<String> getAll() async {
    var response = await http.get(Uri.parse('$_urllocalHost/$_recurso'));

    return response.body;
  }

  Future<String> deleteById(String id) async {
    var response = await http.delete(Uri.parse('$_urllocalHost/$_recurso/$id'));
    return response.body;
  }

  Future<String> updateById(String id) async {
    var response = await http.put(Uri.parse('$_urllocalHost/$_recurso/$id'));
    return response.body;
  }

  Future<String> getById(String id) async {
    var response = await http.get(Uri.parse('$_urllocalHost/$_recurso/$id'));
    return response.body;
  }

  Future<http.Response> createTransacao(
      String id, String nome, String valor) async {
    return await http.post(
      (Uri.parse('$_urllocalHost/$_recurso/$id')),
      body: jsonEncode(<String, String>{
        'id': id,
        "nome": nome,
        "valor": valor,
      }),
    );
  }
}
