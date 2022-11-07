class Playlist {
  String image;
  String title;
  String quality;
  String artist;
  bool currentPlaying;

  Playlist({required this.image, required this.title, required this.quality, required this.artist, required this.currentPlaying});

  Playlist setPlaylist() {
    return Playlist(image: image, title: title, quality: quality, artist: artist, currentPlaying: currentPlaying);
  }
}