import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/barnameview/utils/updateurl.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';

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
  double itemHeight = 90;
  double itemSpacing = 10;
  double dividerTickness = 2;
  double getLineHeight(int length) =>
      ((itemHeight + itemSpacing) / 2) - dividerTickness / 2;
  Color getLineColor(int systemSubId) => Colors.grey;
  // HexColor.fromHex(colorList[systemSubId]);
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
                        onTap: () {
                          updatePageUrl(index);
                          fetchActivity(index.toString());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(color: Colors.white30)),
                          ),
                          alignment: Alignment.center,
                          width: 80,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'جلسه ',
                                style: context.anjomanLight.copyWith(
                                  fontSize: 12,
                                  color: _selectedDay != index
                                      ? Colors.white
                                      : background,
                                ),
                              ),
                              Text(
                                replaceFarsiNumber('${filledDays[index] + 1}'),
                                style: context.anjomanBlack.copyWith(
                                  fontSize: 20,
                                  color: _selectedDay != index
                                      ? Colors.white
                                      : background,
                                ),
                              ),
                            ],
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
                    List<List<ActivityItem>> groupedList = [];
                    Map<String, Map<int, List<ActivityItem>>> grouped = {};
                    for (var movement in harkat) {
                      print(movement.system);
                      var key = movement.expand.system?.title ?? 'بدون سیستم';

                      grouped.putIfAbsent(key, () => {});
                      grouped[key]!.putIfAbsent(movement.systemSubId, () => []);
                      grouped[key]![movement.systemSubId]!.add(movement);
                    }

                    grouped.forEach((system, subsystems) {
                      subsystems.forEach((subsystem, list) {
                        groupedList.add(list);
                      });
                    });

                    List<Widget> movementWidgets = [];
                    grouped.forEach((system, subsystems) {
                      subsystems.forEach((subsystem, list) {
                        movementWidgets.add(
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // هدر سیستم و زیرسیستم
                              Text(system, style: context.anjomanBold),
                              SizedBox(height: 10),
                              // آیتم‌های گروه
                              Column(
                                children: List.generate(list.length, (index) {
                                  return Row(
                                    children: [
                                      // اتصال بصری بین آیتم‌ها (خط عمودی)
                                      if (list.length > 1)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            index != 0
                                                ? Container(
                                                    width: dividerTickness,
                                                    height: getLineHeight(
                                                        list.length),
                                                    color: getLineColor(
                                                      list[index].systemSubId,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: getLineHeight(
                                                        list.length)),
                                            Container(
                                              width: 20,
                                              height: dividerTickness,
                                              color: getLineColor(
                                                list[index].systemSubId,
                                              ),
                                            ),
                                            index != list.length - 1
                                                ? Container(
                                                    width: dividerTickness,
                                                    height: getLineHeight(
                                                      list.length,
                                                    ),
                                                    color: getLineColor(
                                                      list[index].systemSubId,
                                                    ),
                                                  )
                                                : SizedBox(
                                                    height: getLineHeight(
                                                      list.length,
                                                    ),
                                                  ),
                                          ],
                                        ),

                                      // عنوان حرکت
                                      Expanded(
                                        child: SizedBox(
                                          height: itemHeight,
                                          child: InkWell(
                                            onTap: () => context.push(
                                                '$barnameDetailPage?recordId=${list[index].id}'),
                                            child: ClipRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10, sigmaY: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white
                                                        .withOpacity(0.05),
                                                    border: Border.all(
                                                        color: Colors.white10),
                                                  ),
                                                  padding: EdgeInsets.all(8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4),
                                                        child: AspectRatio(
                                                          aspectRatio: 1,
                                                          child: Image.network(
                                                            list[index]
                                                                    .expand
                                                                    .activity
                                                                    ?.expand
                                                                    ?.image ??
                                                                '',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              list[index]
                                                                      .expand
                                                                      .activity
                                                                      ?.title ??
                                                                  'بدون نام',
                                                              style: context
                                                                  .anjomanLight,
                                                            ),
                                                            SizedBox(height: 4),
                                                            Column(
                                                              children: [
                                                                Builder(builder:
                                                                    (context) {
                                                                  var text = '';
                                                                  if (list.isNotEmpty &&
                                                                      list
                                                                          .toList()[
                                                                              index]
                                                                          .activitySet
                                                                          .isNotEmpty) {
                                                                    for (var element in list
                                                                        .toList()[
                                                                            index]
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
                                                                    style: context
                                                                        .anjomanExtraLight,
                                                                  );
                                                                }),
                                                              ],
                                                            ),
                                                            Spacer(),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  list[index]
                                                                          .expand
                                                                          .system
                                                                          ?.title ??
                                                                      '',
                                                                  style: context
                                                                      .anjomanLight,
                                                                ),
                                                                Spacer(),
                                                                Text(
                                                                  'جزئیات',
                                                                  style: context
                                                                      .anjomanExtraLight
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.white54),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .arrow_forward_ios,
                                                                  color: Colors
                                                                      .white54,
                                                                  size: 12,
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ],
                          ),
                        );
                      });
                    });

                    return ListView.separated(
                      padding: EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return movementWidgets[index];
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12),
                      itemCount: movementWidgets.length,
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
