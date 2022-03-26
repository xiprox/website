class Track {
  final String? name;
  final String? previewUrl;
  final String? externalUrl;
  final String? albumName;
  final String? albumArtLarge;
  final String? albumArtSmall;
  final String? albumExternalUrl;
  final String? artistName;
  final String? artistExternalUrl;

  Track({
    this.name,
    this.previewUrl,
    this.externalUrl,
    this.albumName,
    this.albumArtLarge,
    this.albumArtSmall,
    this.albumExternalUrl,
    this.artistName,
    this.artistExternalUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'preview_url': previewUrl,
      'external_url': externalUrl,
      'album_name': albumName,
      'album_art_large': albumArtLarge,
      'album_art_small': albumArtSmall,
      'album_external_url': albumExternalUrl,
      'artist_name': artistName,
      'artist_external_url': artistExternalUrl,
    };
  }

  static Track fromJson(Map<String, dynamic> json) {
    return Track(
      name: json['name'],
      previewUrl: json['preview_url'],
      externalUrl: json['external_url'],
      albumName: json['album_name'],
      albumArtLarge: json['album_art_large'],
      albumArtSmall: json['album_art_small'],
      albumExternalUrl: json['album_external_url'],
      artistName: json['artist_name'],
      artistExternalUrl: json['artist_external_url'],
    );
  }
}
