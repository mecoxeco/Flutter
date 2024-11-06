import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../service/playlist_service.dart';

class PlaylistController extends ChangeNotifier {
  final PlaylistService _playlistService = PlaylistService();
  List<Playlist> playlists = [];

  Future<void> fetchPlaylists() async {
    playlists = await _playlistService.getPlaylists();
    notifyListeners();
  }

  Future<void> createPlaylist(Playlist playlist) async {
    await _playlistService.createPlaylist(playlist);
    fetchPlaylists();
  }

  Future<void> deletePlaylist(int id) async {
    await _playlistService.deletePlaylist(id);
    fetchPlaylists();
  }
}
