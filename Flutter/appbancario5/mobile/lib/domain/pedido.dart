import 'package:appbancario5/domain/produto.dart';

class Pedido {
  String nomeCliente;
  List<Produto> produtos;

  Pedido(this.nomeCliente) : produtos = [];

  void adicionarProduto(Produto produto) {
    produtos.add(produto);
  }

  void removerProduto(Produto produto) {
    produtos.remove(produto);
  }
}
