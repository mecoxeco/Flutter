import 'package:flutter/material.dart';

class CardList extends StatelessWidget {

  final String titulo;
  final String subTitulo;

  const CardList(this.titulo,this.subTitulo,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titulo),
        subtitle: Text(subTitulo),
      ),
    );
  }
}
