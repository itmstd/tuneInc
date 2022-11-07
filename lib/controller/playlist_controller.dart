import 'package:get/get.dart';

import '../model/playlist_model.dart';

class PlaylistController extends GetxController {

  RxList<Playlist> playList = <Playlist>[].obs;

  void addSong(Playlist song){
    playList.add(song);
    print(playList);
  }

  void removeSong(Playlist song){
    playList.remove(song);
  }

  void removeAllSong(){
    playList.clear();
  }
}