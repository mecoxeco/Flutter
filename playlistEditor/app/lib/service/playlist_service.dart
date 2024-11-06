import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/playlist.dart';

class PlaylistService {
  final String baseUrl = "http://localhost:3000/playlists";

  Future<List<Playlist>> getPlaylists() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Playlist.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load playlists');
    }
  }

  Future<void> createPlaylist(Playlist playlist) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(playlist.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create playlist');
    }
  }

  Future<void> deletePlaylist(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete playlist');
    }
  }
}
