import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vamos/core/service/controller/authController.dart';
import 'package:vamos/ui/utils/color.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late ChewieController _chewieController;
  int selectedVideoIndex = Get.find<AuthController>().selectedVideo;
  List<File> files = Get.find<AuthController>().files;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController:
          VideoPlayerController.file(File(files[selectedVideoIndex].path)),
      aspectRatio: 1 / 2,
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(color: kLogoColor2),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 50.w,
          child: Image.asset(
            "assets/logo.webp",
          ),
        ),
      ),
      body: Center(
          child: Chewie(
        controller: _chewieController,
      )),
    );
  }
}

class NetworkVideoPlayer extends StatefulWidget {
  const NetworkVideoPlayer({Key? key}) : super(key: key);

  @override
  _NetworkVideoPlayerState createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    int selectedVideoIndex = Get.find<AuthController>().selectedNetworkVideo;
    String url =
        Get.find<AuthController>().networkFiles[selectedVideoIndex]["url"];
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    print(url + "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    print("AAAAAAAAAAAAAAAA");
    _videoPlayerController1 = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4");
    await Future.wait([
      _videoPlayerController1.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 1 / 2,
      autoInitialize: true,
      autoPlay: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: TextStyle(color: kLogoColor2),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 50.w,
          child: Image.asset(
            "assets/logo.webp",
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                        // SizedBox(height: 20),
                        // Text('Loading'),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
