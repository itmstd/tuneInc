import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../controller/home_page/home_page_controller.dart';
import '../controller/playlist_controller.dart';
import '../model/home_page/home_page_model.dart';
import '../model/playlist_model.dart';

class SongsWidget extends StatelessWidget {
  List<Songs> songList;
  HomePageController homeController;
  PlaylistController playlistController;

  SongsWidget({Key? key, required this.songList, required this.homeController, required this.playlistController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: (1 / 1.2),),
        itemCount: songList.length,
        itemBuilder: (context, index){
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
                songList[index].quality == 'HD'
                    ? !homeController.isPremium.value ? Colors.black26 : Colors.white.withOpacity(0.01)
                    : Colors.white.withOpacity(0.01),
                BlendMode.srcATop
            ),
            child: GestureDetector(
              onTap: (){
                songList[index].quality == 'MV'
                    ? playlistController.addSong(Playlist(image: songList[index].image, title: songList[index].title, quality: 'MV', artist: songList[index].artist, currentPlaying: false))
                    : homeController.isPremium.value
                    ? playlistController.addSong(Playlist(image: songList[index].image, title: songList[index].title, quality: 'HD', artist: songList[index].artist, currentPlaying: false))
                    : showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('This is for premium user'),
                        content: Container(
                          height: 150,
                          child: Column(
                            children: [
                              Expanded(child: const Text('Upgrade to premium plan now')),
                              Row(children: [
                                Expanded(child: TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel'))),
                                Expanded(child: TextButton(onPressed: (){
                                  homeController.prefs.setBool('premiumUser', true);
                                  homeController.isPremium.value = true;
                                  Navigator.pop(context);
                                  homeController.isLoading.value = true;
                                  Future.delayed(Duration(seconds: 3)).then((value) => homeController.isLoading.value = false);
                                }, child: Text('See Plan')))
                              ],)
                            ],
                          ),
                        ),
                      );
                    }
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20, bottom: 20),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.white//Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(songList[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      songList[index].title,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            songList[index].artist,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      songList[index].quality,
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
