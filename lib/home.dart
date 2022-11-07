import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_lyric/lyrics_reader.dart';
import 'package:flutter_pos_app/constants.dart';
import 'package:flutter_pos_app/controller/home_page/home_page_controller.dart';
import 'package:flutter_pos_app/controller/playlist_controller.dart';
import 'package:flutter_pos_app/model/playlist_model.dart';
import 'package:flutter_pos_app/widgets/playlist_widget.dart';
import 'package:flutter_pos_app/widgets/songs_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var lyricUI = UINetease();
  PlaylistController playlistController = Get.put(PlaylistController());
  HomePageController homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeController.isLoading.value == true ? const Center(child: CircularProgressIndicator(),) : Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              _topMenu(
                title: 'Welcome',
                subTitle: DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                action: _search(),
              ),
              Row(children: [Text('Discover', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)],),
              Obx(() => Container(
                height: 100,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _itemTab(
                      icon: 'icons/icon-burger.png',
                      title: 'Rock',
                      isActive: homeController.genreSelection.value == 1 ? true : false,
                    ),
                    _itemTab(
                      icon: 'icons/icon-noodles.png',
                      title: 'Ballad',
                      isActive: homeController.genreSelection.value == 2 ? true : false,
                    ),
                    _itemTab(
                      icon: 'icons/icon-drinks.png',
                      title: 'Pop',
                      isActive: homeController.genreSelection.value == 3 ? true : false,
                    ),
                    _itemTab(
                      icon: 'icons/icon-desserts.png',
                      title: 'Jazz',
                      isActive: homeController.genreSelection.value == 4 ? true : false,
                    )
                  ],
                ),
              )),
              Expanded(
                child: Obx(() => SongsWidget(
                  songList: homeController.genreSelection.value == 1
                      ? rockSongs
                      : homeController.genreSelection.value == 2 ? balladSongs
                      : homeController.genreSelection.value == 3 ? popSongs
                      : homeController.genreSelection.value == 4 ? jazzSongs
                      : rockSongs,
                  playlistController: playlistController,
                  homeController: homeController,
                )),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 5,
          child: Obx(()=>Column(
            children: [
              _topMenu(
                title: 'Playlist',
                subTitle: 'Total songs ${playlistController.playList.length}',
                action: Container(),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    ...playlistController.playList.map((value){return PlaylistWidget(playlist: value);}),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xfff4f5fc),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Vandalize', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
                                Expanded(
                                  child: LyricsReader(
                                    emptyBuilder: () => const Center(
                                      child: Text(
                                        "No lyrics",
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                const LinearProgressIndicator(value: 50,)
                              ],
                            ),
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
                              color: Color(0xffdae1ef)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.skip_previous), iconSize: 18,),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.pause_circle), iconSize: 32,),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.skip_next), iconSize: 18,)
                            ],),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ],
    ));
  }

  Widget _item({
    required String image,
    required String title,
    required String price,
    required String item,
  }) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          item == 'HD'
              ? !homeController.isPremium.value ? Colors.black26 : Colors.white.withOpacity(0.01)
              : Colors.white.withOpacity(0.01),
          BlendMode.srcATop
      ),
      child: GestureDetector(
        onTap: (){
          item == 'MV'
              ? playlistController.addSong(Playlist(image: image, title: title, quality: 'MV', artist: price, currentPlaying: false))
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
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
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
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    item,
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemTab(
      {required String icon, required String title, required bool isActive}) {
    return GestureDetector(
      onTap: () {
        if(title == 'Rock'){
          homeController.genreSelection.value = 1;
        } else if(title == 'Ballad'){
          homeController.genreSelection.value = 2;
        } else if(title == 'Pop'){
          homeController.genreSelection.value = 3;
        } else if(title == 'Jazz'){
          homeController.genreSelection.value = 4;
        }
      } ,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 26),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, //const Color(0xff363636),
          border: isActive
              ? Border.all(color: Colors.deepOrangeAccent, width: 3)
              : Border.all(color: Colors.transparent/*const Color(0xff363636)*/, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   icon,
            //   width: 38,
            // ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _topMenu({
    required String title,
    required String subTitle,
    required Widget action,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subTitle,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 10,
              ),
            ),
          ],
        ),
        Expanded(flex: 1, child: Container(width: double.infinity)),
        Expanded(flex: 5, child: action),
      ],
    );
  }

  Widget _search() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xfff4f5fc),
        ),
        child: Row(
          children: const [
            Icon(
              Icons.search,
              color: Colors.black54,
            ),
            SizedBox(width: 10),
            Text(
              'Search menu here...',
              style: TextStyle(color: Colors.black54, fontSize: 11),
            )
          ],
        ));
  }
}
