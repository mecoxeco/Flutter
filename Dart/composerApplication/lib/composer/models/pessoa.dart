import 'package:composerapplication/composer/models/enums/tipo_pessoa.dart';

abstract class Pessoa {
  String getNome();

  TipoPessoa getTipo();
}
