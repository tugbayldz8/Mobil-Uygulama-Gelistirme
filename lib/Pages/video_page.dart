import 'package:app_jam_deneme_1/Pages/proje_tanitim.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Proje Tanıtım Videosu'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          VideoItems(
            videoPlayerController:
                VideoPlayerController.asset('assets/proje_tanitim.mp4'),
            looping: true,
            autoplay: true,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.network(
                'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'),
            looping: false,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}
