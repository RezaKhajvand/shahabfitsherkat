import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:video_player/video_player.dart';

class BarnameDetailPage extends StatefulWidget {
  final String recordId;
  const BarnameDetailPage({
    super.key,
    required this.recordId,
  });

  @override
  State<BarnameDetailPage> createState() => _BarnameDetailPageState();
}

class _BarnameDetailPageState extends State<BarnameDetailPage> {
  late VideoPlayerController videoController;
  bool _showDescription = true;
  Timer? _hideTimer;
  final Duration animationTime = Duration(milliseconds: 300);

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(
        Duration(milliseconds: 2500),
        () => setState(() {
              if (!videoController.value.isPlaying) {
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
    videoController.dispose();
    super.dispose();
  }

  void _toggleScreen() {
    setState(() => _showDescription = !_showDescription);
    if (videoController.value.isPlaying) {
      _startHideTimer();
    }
  }

  void _togglePlay() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
      if (_showDescription) {
        _startHideTimer();
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context
        .read<BarnameViewBloc>()
        .add(FetchActivityEvent(recordId: widget.recordId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background.withValues(alpha: 0.8),
        title: Text('توضیحات حرکت', style: context.anjomanExtraBold),
      ),
      body: BlocConsumer<BarnameViewBloc, BarnameViewState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is BarnameViewLoaded) {
            final harkat = state.basketActivity.first;
            videoController = harkat.videoController!;
            videoController.setLooping(true);
            final description = harkat.expand.activity?.description;
            return SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => _toggleScreen(),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        AbsorbPointer(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                                width: videoController.value.size.width,
                                height: videoController.value.size.height,
                                child: VideoPlayer(videoController)),
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: _showDescription ? 1 : 0,
                          curve: Curves.ease,
                          duration: animationTime,
                          child: Center(
                              child: IconButton(
                                  onPressed:
                                      _showDescription ? _togglePlay : null,
                                  icon: Icon(
                                      videoController.value.isPlaying
                                          ? Icons.pause_circle_filled_rounded
                                          : Icons.play_circle_filled_rounded,
                                      size: 60))),
                        ),
                      ],
                    ),
                  ),
                  if (description != null && description.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(description, style: context.anjomanLight),
                    ),
                ],
              ),
            );
          }
          if (state is BarnameViewLoading) {
            return LoadingWidget();
          }
          if (state is BarnameViewError) {
            return Center(
              child: Text(state.errormessage, style: context.anjomanLight),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
