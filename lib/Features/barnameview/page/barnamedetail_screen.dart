import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
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
  @override
  void initState() {
    super.initState();
    context
        .read<BarnameViewBloc>()
        .add(FetchActivityEvent(recordId: widget.recordId));
  }

  @override
  void dispose() {
    super.dispose();
    context.read<BarnameViewBloc>().add(DisposeBarnameEvent());
  }

  playVideo(VideoPlayerController controller) {
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        image: DecorationImage(
          image: AssetImage('images/shahabbg.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: background.withValues(alpha: 0.8),
          title: Text('توضیحات حرکت', style: context.anjomanExtraBold),
        ),
        body: BlocConsumer<BarnameViewBloc, BarnameViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BarnameViewLoaded) {
              final harkat = state.basketActivity;
              return ListView.separated(
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            final VideoPlayerController? controller =
                                harkat[index].controller;
                            if (controller == null) {
                              return LoadingWidget();
                            }

                            return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: SizedBox(
                                    width: controller.value.size.width,
                                    height: controller.value.size.height,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        VideoPlayer(controller),
                                        IconButton(
                                            onPressed: () =>
                                                playVideo(controller),
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: background,
                                              size: 40,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: 8),
                        Text(harkat[index].expand.activity?.title ?? 'بدون نام',
                            style: context.anjomanBold),
                        SizedBox(height: 2),
                        Builder(builder: (context) {
                          var text = '';
                          if (harkat.isNotEmpty &&
                              harkat.toList()[index].activitySet.isNotEmpty) {
                            for (var element
                                in harkat.toList()[index].activitySet) {
                              text = text +
                                  (text.isEmpty ? '' : ' - ') +
                                  (element.first == 1
                                      ? '${element.last}'
                                      : '${element.first}x${element.last}');
                            }
                          }
                          return Text(replaceFarsiNumber('ست ها : $text'),
                              style: context.anjomanExtraLight);
                        }),
                        SizedBox(height: 8),
                        Text(
                            harkat[index].expand.activity?.description ??
                                'بدون توضیح',
                            style: context.anjomanLight),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 20),
                  itemCount: harkat.length);
            }
            if (state is BarnameViewLoading) {
              return LoadingWidget();
            }
            if (state is BarnameViewError) {
              return Center(
                child: Text(
                  state.errormessage,
                  style: context.anjomanLight,
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
