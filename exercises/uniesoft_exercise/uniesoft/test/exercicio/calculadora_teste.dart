
import 'package:test/test.dart';
import 'package:uniesoft/exercicio/calculadora.dart';

void main () {

  test('Deve calcular media', () {
    var resultado = calcularMedia({'Matematica':[30, 45, 67, 42]});

    expect(resultado.keys.first, 'Matematica');
    expect(resultado.values.first, 46);

  });

}