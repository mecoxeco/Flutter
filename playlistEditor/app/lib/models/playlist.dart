class Playlist {
  final int id;
  final String name;
  final List<int> musicIds;

  Playlist({required this.id, required this.name, required this.musicIds});

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      id: json['id'],
      name: json['name'],
      musicIds: List<int>.from(json['musics']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'musics': musicIds,
    };
  }
}
