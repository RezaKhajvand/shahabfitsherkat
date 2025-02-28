import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

ChewieController setChewieController(ActivityItem element) {
  return ChewieController(
    videoPlayerController: element.videoController!,
    draggableProgressBar: false,
    cupertinoProgressColors: ChewieProgressColors(
      backgroundColor: background,
      handleColor: Colors.white,
      playedColor: Colors.white,
      bufferedColor: Colors.white10,
    ),
    materialProgressColors: ChewieProgressColors(
      backgroundColor: background,
      handleColor: Colors.white,
      playedColor: Colors.white,
      bufferedColor: Colors.white10,
    ),
    showControls: true,
    showOptions: false,
    showSubtitles: false,
    autoPlay: false,
    looping: true,
    allowFullScreen: false,
    allowMuting: false,
    hideControlsTimer: Duration(milliseconds: 500),
  );
}
