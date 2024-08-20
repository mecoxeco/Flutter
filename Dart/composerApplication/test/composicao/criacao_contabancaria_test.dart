import 'package:composerapplication/composer/models/conta_bancaria.dart';
import 'package:composerapplication/composer/models/titular.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve criar uma conta bancária com saldo inicial Zero', () {
    var contaBancaria = ContaBancaria(
      Titular.pessoaFisica('João'),
    );

    expect(contaBancaria.getSaldo(), 0.0);

    contaBancaria.depositar(200.0);

    expect(contaBancaria.getSaldo(), 200.0);
  });
}
