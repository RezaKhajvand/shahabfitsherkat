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
  final DraggableScrollableController _scrollController =
      DraggableScrollableController();
  bool _showDescription = true;
  Timer? _hideTimer;
  final double _minSheetSize = 0.2; // مقدار اولیه کوچک
  final double _maxSheetSize = 0.4; // مقدار بزرگ حداکثر
  double _liveSheetSize = 0.2;
  final Duration animationTime = Duration(milliseconds: 300);
  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(
        Duration(milliseconds: 2500),
        () => setState(() {
              if (_liveSheetSize > _minSheetSize ||
                  !widget.videoController.value.isPlaying) {
                _hideTimer?.cancel();
              } else {
                _showDescription = false;
                _startHideTimer();
              }
            }));
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _hideTimer = null;
    super.dispose();
  }

  void _toggleScreen() {
    setState(() => _showDescription = !_showDescription);
    if (widget.videoController.value.isPlaying) {
      _startHideTimer();
    }
  }

  void _togglePlay() {
    if (widget.videoController.value.isPlaying) {
      widget.videoController.pause();
    } else {
      widget.videoController.play();
      if (_showDescription) {
        _startHideTimer();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    widget.videoController.addListener(() => setState(() {}));
    _scrollController.addListener(() {
      _liveSheetSize = _scrollController.size;
      print(_liveSheetSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    final description = widget.element.expand.activity?.description;
    return GestureDetector(
      onTap: () => _toggleScreen(),
      child: Material(
        color: Colors.transparent,
        child: AnimatedOpacity(
          opacity: _showDescription ? 1 : 0,
          curve: Curves.ease,
          duration: animationTime,
          child: Stack(
            children: [
              Center(
                  child: IconButton(
                      onPressed: _showDescription ? _togglePlay : null,
                      icon: Icon(
                          widget.videoController.value.isPlaying
                              ? Icons.pause_circle_filled_rounded
                              : Icons.play_circle_filled_rounded,
                          size: 60))),
              if (description != null && description.isNotEmpty)
                AnimatedSlide(
                  offset: Offset(0, _showDescription ? 0 : 0.3),
                  curve: Curves.ease,
                  duration: animationTime,
                  child: DraggableScrollableSheet(
                    controller: _scrollController,
                    initialChildSize: _minSheetSize,
                    minChildSize: _minSheetSize,
                    maxChildSize: _maxSheetSize,
                    builder: (context, scrollController) => Material(
                      color: Colors.black54,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(16),
                        controller: scrollController,
                        child: Text(
                          description,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
