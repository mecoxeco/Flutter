import 'package:composerapplication/composer/models/enums/tipo_pessoa.dart';
import 'package:composerapplication/composer/models/pessoa.dart';

class Titular extends Pessoa {
  final String _nome;
  late TipoPessoa _tipoPessoa;

  Titular(this._tipoPessoa, this._nome);

  Titular.pessoaFisica(this._nome) {
    _tipoPessoa = TipoPessoa.fisica;
  }

  Titular.pessoaJuridica(this._nome) {
    _tipoPessoa = TipoPessoa.juridica;
  }

  @override
  TipoPessoa getTipo() {
    return _tipoPessoa;
  }

  @override
  String getNome() {
    return _nome;
  }
}
