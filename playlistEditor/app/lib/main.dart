import 'package:flutter/material.dart';
import 'controller/music_controller.dart';
import 'controller/playlist_controller.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MusicController()),
        ChangeNotifierProvider(create: (_) => PlaylistController()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.black,  // Cor primária do tema
          colorScheme: ColorScheme.dark(
            primary: Colors.green,   // Cor principal do tema
            secondary: Colors.green, // Cor secundária
            surface: Colors.black,   // Cor de superfícies (como cards, etc.)
            onPrimary: Colors.white, // Cor de texto e ícones em fundos primários
            onSecondary: Colors.white, // Cor de texto e ícones em fundos secundários
            onSurface: Colors.white, // Cor de texto e ícones em superfícies
          ),
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white), // Substituindo bodyText1 por bodyLarge
            bodyMedium: TextStyle(color: Colors.white), // Substituindo bodyText2 por bodyMedium
            titleLarge: TextStyle(color: Colors.white), // Para títulos grandes
            titleMedium: TextStyle(color: Colors.white), // Para títulos médios
          ),
        ),
        home: HomeScreen(), // Adicionando const aqui
      ),
    );
  }
}
