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
      aspectRatio: 16 / 9,
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
