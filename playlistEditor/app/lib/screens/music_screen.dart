import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/music_controller.dart';
import '../models/music.dart';
import '../components/music_card.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({Key? key}) : super(key: key); // Adicionando const ao construtor

  @override
  Widget build(BuildContext context) {
    final musicController = Provider.of<MusicController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca de Músicas'), // Usando const aqui
        backgroundColor: Colors.green, // Cor do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Usando const aqui
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAddMusicDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Cor de fundo do botão
              ),
              child: const Text(
                'Adicionar Música',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
            ),
            const SizedBox(height: 16), // Usando const aqui
            Expanded(
              child: FutureBuilder(
                future: musicController.fetchMusics(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Erro ao carregar músicas', style: TextStyle(color: Colors.white))); // Texto branco
                  }

                  final musics = musicController.musics;
                  if (musics.isEmpty) {
                    return const Center(child: Text('Nenhuma música encontrada.', style: TextStyle(color: Colors.white))); // Texto branco
                  }

                  return ListView.builder(
                    itemCount: musics.length,
                    itemBuilder: (context, index) {
                      return MusicCard(music: musics[index]);
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

  void _showAddMusicDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController urlController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Música', style: TextStyle(color: Colors.white)), // Título branco
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Título', labelStyle: TextStyle(color: Colors.white)), // Label branco
                style: const TextStyle(color: Colors.white), // Texto do campo branco
              ),
              TextField(
                controller: urlController,
                decoration: const InputDecoration(labelText: 'URL', labelStyle: TextStyle(color: Colors.white)), // Label branco
                style: const TextStyle(color: Colors.white), // Texto do campo branco
              ),
            ],
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
                final title = titleController.text;
                final url = urlController.text;

                if (title.isNotEmpty && url.isNotEmpty) {
                  final music = Music(id: 0, title: title, url: url);
                  Provider.of<MusicController>(context, listen: false).addMusic(music);
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}
