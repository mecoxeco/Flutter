import 'package:flutter_test/flutter_test.dart';
import 'package:app/controller/music_controller.dart';
import 'package:app/models/music.dart';


void main() {
  group('MusicController', () {
    test('should add a music to the list', () {
      final controller = MusicController();

      final music = Music(id: 1, title: 'Song 1', url: 'http://song1.com');
      controller.addMusic(music);

      expect(controller.musics.length, 1);
      expect(controller.musics[0].title, 'Song 1');
    });

    test('should remove a music from the list', () {
      final controller = MusicController();

      final music = Music(id: 1, title: 'Song 1', url: 'http://song1.com');
      controller.addMusic(music);
      controller.deleteMusic(1);

      expect(controller.musics.isEmpty, true);
    });

    test('should not add duplicate music', () {
      final controller = MusicController();

      final music = Music(id: 1, title: 'Song 1', url: 'http://song1.com');
      controller.addMusic(music);
      controller.addMusic(music); // Attempting to add a duplicate

      expect(controller.musics.length, 1);
    });
  });
}
