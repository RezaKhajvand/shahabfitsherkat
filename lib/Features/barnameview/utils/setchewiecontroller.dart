import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:video_player/video_player.dart';

ChewieController setChewieController(
    ActivityItem element, VideoPlayerController videoController) {
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
      customControls:
          TelegramPlayer(element: element, videoController: videoController));
}

class TelegramPlayer extends StatefulWidget {
  final ActivityItem element;
  final VideoPlayerController videoController;
  const TelegramPlayer({
    super.key,
    required this.element,
    required this.videoController,
  });

  @override
  State<TelegramPlayer> createState() => _TelegramPlayerState();
}

class _TelegramPlayerState extends State<TelegramPlayer> {
  bool _showDescription = true;
  Timer? _hideTimer;

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(Duration(milliseconds: 1500), () {
      setState(() {
        _showDescription = false;
      });
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  void _toggleDescription() {
    widget.videoController.play();
    setState(() {
      _showDescription = !_showDescription;
    });
    if (_showDescription) {
      _startHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showDescription ? 1 : 0,
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () => _toggleDescription(),
        child: Stack(
          children: [
            Center(
              child: Icon(
                Icons.play_circle_filled_rounded,
                size: 45,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(12),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        widget.element.expand.activity?.description ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
