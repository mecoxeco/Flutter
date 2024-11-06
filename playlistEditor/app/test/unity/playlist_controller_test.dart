import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:app/controller/playlist_controller.dart';
import 'package:app/models/playlist.dart';

class MockPlaylistController extends Mock implements PlaylistController {}

void main() {
  group('PlaylistController Mock', () {
    test('should call createPlaylist once', () {
      final mockController = MockPlaylistController();
      final playlist = Playlist(id: 1, name: 'My Playlist', musicIds: []);

      mockController.createPlaylist(playlist);

      verify(() => mockController.createPlaylist(playlist)).called(1);
    });

    test('should call deletePlaylist once', () {
      final mockController = MockPlaylistController();
      final playlist = Playlist(id: 1, name: 'My Playlist', musicIds: []);
      mockController.createPlaylist(playlist);

      mockController.deletePlaylist(1);

      verify(() => mockController.deletePlaylist(1)).called(1);
    });

    test('should return empty list of playlists', () {
      final mockController = MockPlaylistController();
      when(() => mockController.playlists).thenReturn([]);

      final playlists = mockController.playlists;

      expect(playlists.isEmpty, true);
    });
  });
}
