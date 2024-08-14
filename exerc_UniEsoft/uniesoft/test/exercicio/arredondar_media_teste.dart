import 'package:test/test.dart';
import 'package:uniesoft/exercicio/arredondar_media.dart';
import 'package:uniesoft/exercicio/calculadora.dart';

void main() {

  test('deve arredondar numeros para multiplos de 5', () {

    expect(arredondaMedia(84), 85);
    expect(arredondaMedia(57), 57);
    expect(arredondaMedia(58), 60);
    expect(arredondaMedia(59), 60);
    expect(arredondaMedia(60), 60);

  });

  test('cenário de alunos', () {

    Map<String, Map<String, List<int>>> alunos = {
      'Joao': {
        'Matematica': [30, 45, 67, 42],
        'Historia': [35, 37, 30, 46],
        'Ciencias' : [73, 65, 79, 83]
      },
      'Joaquim': {
        'Matematica': [61,60,85,62],
        'Historia': [],
        'Ciencias' : []
      },
      'Josias': {
        'Matematica': [],
        'Historia': [],
        'Ciencias' : []
      }

    };

    alunos.forEach((key, value) {
      
      var mediaDisciplina = calcularMedia(value);

        int notaFinal = arredondaMedia(mediaDisciplina.values.first);
    });





  });

  



}