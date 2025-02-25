import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:video_player/video_player.dart';

class BarnameViewPage extends StatefulWidget {
  final String basketId;
  final String tabIndex;
  const BarnameViewPage(
      {super.key, required this.basketId, required this.tabIndex});

  @override
  State<BarnameViewPage> createState() => _BarnameViewPageState();
}

class _BarnameViewPageState extends State<BarnameViewPage> {
  int _selectedDay = 0;
  List<int> filledDays = [];

  @override
  void initState() {
    super.initState();
    _selectedDay = int.parse(widget.tabIndex);
    fetchActivity(_selectedDay.toString());
  }

  fetchActivity(String day) {
    context
        .read<BarnameViewBloc>()
        .add(FetchBarnameEvent(basketId: widget.basketId, dayOfWeek: day));
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
        body: Row(
          children: [
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: List.generate(
                  filledDays.length,
                  (index) => Expanded(
                    child: Material(
                      color: _selectedDay == index ? primary : background,
                      child: InkWell(
                        onTap: () => fetchActivity(index.toString()),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(color: Colors.white30)),
                          ),
                          alignment: Alignment.center,
                          width: 100,
                          child: Text(
                            'جلسه ${replaceFarsiNumber('${filledDays[index]}')}',
                            style: context.anjomanLight.copyWith(
                              color: _selectedDay != index
                                  ? Colors.white
                                  : background,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
            Expanded(
              child: BlocConsumer<BarnameViewBloc, BarnameViewState>(
                listener: (context, state) {
                  if (state is BarnameViewLoaded) {
                    setState(() {
                      _selectedDay = int.parse(state.dayIndex ?? '0');
                      if (filledDays.isEmpty) {
                        filledDays = state.filledDays ?? [0];
                      }
                    });
                  }
                },
                builder: (context, state) {
                  if (state is BarnameViewLoading) {
                    return Center(child: LoadingWidget());
                  }

                  if (state is BarnameViewError) {
                    return Center(
                      child: Text(
                        state.errormessage,
                        style: context.anjomanLight,
                      ),
                    );
                  }

                  if (state is BarnameViewLoaded) {
                    final harkat = state.basketActivity;
                    return ListView.separated(
                      padding: EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => context.push(
                              '$barnameDetailPage?recordId=${harkat[index].id}'),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.05),
                                  border: Border.all(color: Colors.white10),
                                ),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ویدئو
                                    Builder(
                                      builder: (context) {
                                        final VideoPlayerController?
                                            controller =
                                            harkat[index].controller;
                                        if (controller == null) {
                                          return LoadingWidget();
                                        }
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: AspectRatio(
                                            aspectRatio: 2,
                                            child: FittedBox(
                                              fit: BoxFit.cover,
                                              child: SizedBox(
                                                width:
                                                    controller.value.size.width,
                                                height: controller
                                                    .value.size.height,
                                                child: VideoPlayer(controller),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 8),
                                    // اطلاعات حرکات
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          harkat[index]
                                                  .expand
                                                  .activity
                                                  ?.title ??
                                              'بدون نام',
                                          style: context.anjomanLight,
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Builder(builder: (context) {
                                              var text = '';
                                              if (harkat.isNotEmpty &&
                                                  harkat
                                                      .toList()[index]
                                                      .activitySet
                                                      .isNotEmpty) {
                                                for (var element in harkat
                                                    .toList()[index]
                                                    .activitySet) {
                                                  text = text +
                                                      (text.isEmpty
                                                          ? ''
                                                          : ' - ') +
                                                      (element.first == 1
                                                          ? '${element.last}'
                                                          : '${element.first}x${element.last}');
                                                }
                                              }
                                              return Text(
                                                replaceFarsiNumber(
                                                    'ست ها : $text'),
                                                style:
                                                    context.anjomanExtraLight,
                                              );
                                            }),
                                            Spacer(),
                                            Text(
                                              'جزئیات',
                                              style: context.anjomanExtraLight
                                                  .copyWith(
                                                      color: Colors.white54),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white54,
                                              size: 12,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20),
                      itemCount: harkat.length,
                    );
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
