import 'package:flutter/material.dart';
import '../models/playlist.dart';

class PlaylistCard extends StatelessWidget {
  final Playlist playlist;

  PlaylistCard({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        title: Text(playlist.name, style: TextStyle(color: Colors.white)),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            // Função para deletar playlist
          },
        ),
        onTap: () {
          // Ação ao clicar na playlist
        },
      ),
    );
  }
}
