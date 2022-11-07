import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pos_app/model/playlist_model.dart';

class PlaylistWidget extends StatelessWidget {
  Playlist playlist;
  PlaylistWidget({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: playlist.currentPlaying ? const Color(0xfff2817c) : const Color(0xffdae1ef),
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(playlist.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist.title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: playlist.currentPlaying ? Colors.white : Colors.black45,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  playlist.artist,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: playlist.currentPlaying ? Colors.white : Colors.black45,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
