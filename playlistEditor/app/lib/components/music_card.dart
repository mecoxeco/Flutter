import 'package:flutter/material.dart';
import '../models/music.dart';

class MusicCard extends StatelessWidget {
  final Music music;

  MusicCard({required this.music});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        title: Text(music.title, style: TextStyle(color: Colors.white)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // Função para deletar música
          },
        ),
        onTap: () {
          // Ação ao clicar na música
        },
      ),
    );
  }
}
