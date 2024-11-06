import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/playlist_controller.dart';
import '../models/playlist.dart';
import '../components/playlist_card.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key); // Adicionando const ao construtor

  @override
  Widget build(BuildContext context) {
    final playlistController = Provider.of<PlaylistController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists'), // Usando const aqui
        backgroundColor: Colors.green, // Cor do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Usando const aqui
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAddPlaylistDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor de fundo do botão
              ),
              child: const Text(
                'Criar Playlist',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
            ),
            const SizedBox(height: 16), // Usando const aqui
            Expanded(
              child: FutureBuilder(
                future: playlistController.fetchPlaylists(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Erro ao carregar playlists', style: TextStyle(color: Colors.white))); // Texto branco
                  }

                  final playlists = playlistController.playlists;
                  if (playlists.isEmpty) {
                    return const Center(child: Text('Nenhuma playlist encontrada.', style: TextStyle(color: Colors.white))); // Texto branco
                  }

                  return ListView.builder(
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return PlaylistCard(playlist: playlists[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddPlaylistDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Criar Playlist', style: TextStyle(color: Colors.white)), // Título branco
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Nome da Playlist', labelStyle: TextStyle(color: Colors.white)), // Label branco
            style: const TextStyle(color: Colors.white), // Texto do campo branco
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text;

                if (name.isNotEmpty) {
                  final playlist = Playlist(id: 0, name: name, musicIds: []);
                  Provider.of<PlaylistController>(context, listen: false)
                      .createPlaylist(playlist);
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: const Text('Criar'),
            ),
          ],
        );
      },
    );
  }
}
