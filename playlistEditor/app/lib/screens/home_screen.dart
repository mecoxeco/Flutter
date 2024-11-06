import 'package:flutter/material.dart';
import 'music_screen.dart';
import 'playlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key); // Adicionando const ao construtor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu App de Música'), // Usando const aqui
        backgroundColor: Colors.green, // Cor do AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Usando const aqui
        child: Center( // Centraliza o conteúdo na tela
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Alinha verticalmente no centro
            crossAxisAlignment: CrossAxisAlignment.center, // Alinha horizontalmente no centro
            children: [
              // Botão "Biblioteca de Músicas"
              SizedBox(
                width: double.infinity, // Garante que o botão tenha largura total
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Cor de fundo do botão
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MusicScreen()), // Usando const aqui
                    );
                  },
                  child: const Text(
                    'Biblioteca de Músicas',
                    style: TextStyle(color: Colors.white), // Texto branco
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espaçamento entre os botões
              
              // Botão "Playlists"
              SizedBox(
                width: double.infinity, // Garante que o botão tenha largura total
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Cor de fundo do botão
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PlaylistScreen()), // Usando const aqui
                    );
                  },
                  child: const Text(
                    'Playlists',
                    style: TextStyle(color: Colors.white), // Texto branco
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
