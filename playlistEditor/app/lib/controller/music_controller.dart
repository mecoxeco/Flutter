import 'package:flutter/material.dart';
import '../models/music.dart';
import '../service/music_service.dart';

class MusicController extends ChangeNotifier {
  final MusicService _musicService = MusicService();
  List<Music> musics = [];

  Future<void> fetchMusics() async {
    musics = await _musicService.getMusics();
    notifyListeners();
  }

  Future<void> addMusic(Music music) async {
    await _musicService.addMusic(music);
    fetchMusics();
  }

  Future<void> deleteMusic(int id) async {
    await _musicService.deleteMusic(id);
    fetchMusics();
  }
}
