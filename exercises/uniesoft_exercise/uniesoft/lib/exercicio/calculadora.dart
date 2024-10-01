
Map<String, int> calcularMedia(Map<String, List<int>> notasDisciplina) {

  Map<String, int> resultado = {};

  notasDisciplina.forEach((disciplina, notas) {

    double media = notas.reduce((value, element) => value + element) / notas.length;

  resultado.addAll({disciplina: media.toInt()});

  });

  return resultado;

}
