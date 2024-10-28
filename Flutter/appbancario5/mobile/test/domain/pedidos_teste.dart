import 'package:appbancario5/domain/pedido.dart';
import 'package:appbancario5/domain/produto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve adicionar produtos no pedido', () {
    Produto monitor = Produto(10, 'Monitor AOC', 899.90);
    Produto tv = Produto(11, 'TV LG4K', 3299.90);

    Pedido pedidoJoao = Pedido('Joao');

    pedidoJoao.adicionarProduto(monitor);
    pedidoJoao.adicionarProduto(tv);

    expect(pedidoJoao.produtos.length, 2);
    expect(pedidoJoao.produtos[0].valor, 899.90);
    expect(pedidoJoao.produtos[0].nome, 'Monitor AOC');
    expect(pedidoJoao.produtos[1].valor, 3299.90);
    expect(pedidoJoao.produtos[1].nome, 'TV LG4K');
  });

  test('deve remover produtos no pedido', () {
    Produto monitor = Produto(10, 'Monitor AOC', 899.90);
    Produto tv = Produto(11, 'TV LG4K', 3299.90);

    Pedido pedidoJoao = Pedido('Joao');

    pedidoJoao.removerProduto(monitor);
    pedidoJoao.removerProduto(tv);

    expect(pedidoJoao.produtos.length, 0);
  });
}
