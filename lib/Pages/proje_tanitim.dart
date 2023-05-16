import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  const VideoItems(
      {Key? key,
      required this.videoPlayerController,
      required this.looping,
      required this.autoplay})
      : super(key: key);
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
  @override
  State<VideoItems> createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 5 / 8,
        autoInitialize: true,
        autoPlay: widget.autoplay,
        looping: widget.looping,
        errorBuilder: (context, errorMesaage) {
          return Center(
            child: Text(
              errorMesaage,
              style: TextStyle(color: Colors.red),
            ),
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
