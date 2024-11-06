import 'package:flutter_test/flutter_test.dart';
import 'package:app/models/music.dart';

void main() {
  group('Music Model', () {
    test('should create a music object correctly', () {
      final music = Music(id: 1, title: 'Song 1', url: 'http://song1.com');

      expect(music.id, 1);
      expect(music.title, 'Song 1');
      expect(music.url, 'http://song1.com');
    });

    test('should convert to JSON correctly', () {
      final music = Music(id: 1, title: 'Song 1', url: 'http://song1.com');

      final musicJson = music.toJson();
      expect(musicJson['id'], 1);
      expect(musicJson['title'], 'Song 1');
      expect(musicJson['url'], 'http://song1.com');
    });
  });
}
