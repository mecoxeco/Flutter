import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/music.dart';

class MusicService {
  final String baseUrl = "http://localhost:3000/musics";

  Future<List<Music>> getMusics() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Music.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load musics');
    }
  }

  Future<void> addMusic(Music music) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(music.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add music');
    }
  }

  Future<void> deleteMusic(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete music');
    }
  }
}
