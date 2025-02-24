import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:video_player/video_player.dart';

class HarkatController {
  final String id;
  VideoPlayerController? controller;

  HarkatController({required this.id, this.controller});
}

class BarnameViewPage extends StatefulWidget {
  final String basketId;
  const BarnameViewPage({super.key, required this.basketId});

  @override
  State<BarnameViewPage> createState() => _BarnameViewPageState();
}

class _BarnameViewPageState extends State<BarnameViewPage> {
  int _selectedDay = 0;
  @override
  void initState() {
    super.initState();
    context
        .read<BarnameViewBloc>()
        .add(FetchBarnameEvent(basketId: widget.basketId));
  }

  @override
  void dispose() {
    super.dispose();
    context.read<BarnameViewBloc>().add(DisposeBarnameEvent());
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
        body: BlocConsumer<BarnameViewBloc, BarnameViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BarnameViewLoaded) {
              final harkat = state.basketActivity;
              return Row(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Column(
                      children: List.generate(
                        6,
                        (index) => Expanded(
                            child: Material(
                          color: _selectedDay == index ? primary : background,
                          child: InkWell(
                            onTap: () => setState(() => _selectedDay = index),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.white30))),
                              alignment: Alignment.center,
                              width: 100,
                              child: Text(
                                'جلسه ${replaceFarsiNumber('${index + 1}')}',
                                style: context.anjomanLight.copyWith(
                                  color: _selectedDay != index
                                      ? Colors.white
                                      : background,
                                ),
                              ),
                            ),
                          ),
                        )),
                      ),
                    );
                  }),
                  Expanded(
                    child: ListView.separated(
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
                                  return AspectRatio(
                                    aspectRatio: controller.value.aspectRatio,
                                    child: VideoPlayer(controller),
                                  );
                                },
                              ),
                              SizedBox(height: 12),
                              Text(
                                  harkat[index].expand.activity?.title ??
                                      'بدون نام',
                                  style: context.anjomanExtraBold),
                              SizedBox(height: 4),
                              Text(
                                harkat[index].activitySet.toString(),
                                style: context.anjomanMedium,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 6,
                            ),
                        itemCount: harkat.length),
                  ),
                ],
              );
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
