import 'dart:ui';
import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:animated_tree_view/tree_view/tree_view.dart';
import 'package:animated_tree_view/tree_view/widgets/expansion_indicator.dart';
import 'package:animated_tree_view/tree_view/widgets/indent.dart';
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

                    final tree = TreeNode<ActivityItem>.root(
                      data: harkat[0],
                    )..addAll([
                        TreeNode<ActivityItem>(
                          key: harkat[1].id,
                          data: harkat[1],
                        ),
                        TreeNode<ActivityItem>(
                          key: harkat[2].id,
                          data: harkat[2],
                        ),
                      ]);
                    return TreeView.simpleTyped<ActivityItem,
                            TreeNode<ActivityItem>>(
                        tree: tree,
                        padding: EdgeInsets.all(16),
                        showRootNode: true,
                        indentation:
                            const Indentation(color: primary, thickness: 2),
                        expansionIndicatorBuilder: (context, node) {
                          return ChevronIndicator.upDown(
                            tree: node,
                            icon: Icons.keyboard_arrow_down_rounded,
                            alignment: Alignment.centerLeft,
                            color: primary,
                          );
                        },
                        builder: (context, node) {
                          final harkat = node.data;
                          if (harkat == null) {
                            return SizedBox(); // مقدار `null` رو نادیده بگیر
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: 30.0, top: 8, bottom: 8),
                              child: InkWell(
                                onTap: () => context.push(
                                    '$barnameDetailPage?recordId=${harkat.id}'),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white.withOpacity(0.05),
                                        border:
                                            Border.all(color: Colors.white10),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: AspectRatio(
                                              aspectRatio: 3,
                                              child:
                                                  Builder(builder: (context) {
                                                final thumbnail =
                                                    harkat.thumbnail;
                                                if (thumbnail == null) {
                                                  return LoadingWidget();
                                                }
                                                return Image.network(
                                                    thumbnail.path,
                                                    fit: BoxFit.cover);
                                              }),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                harkat.expand.activity?.title ??
                                                    'بدون نام',
                                                style: context.anjomanLight,
                                              ),
                                              SizedBox(height: 4),
                                              harkat.expand.system?.title !=
                                                      null
                                                  ? Column(
                                                      children: [
                                                        SizedBox(height: 4),
                                                        Text(
                                                          harkat.expand.system
                                                                  ?.title ??
                                                              '',
                                                          style: context
                                                              .anjomanLight,
                                                        ),
                                                      ],
                                                    )
                                                  : SizedBox(),
                                              Row(
                                                children: [
                                                  Builder(builder: (context) {
                                                    var text = '';
                                                    if (harkat.activitySet
                                                        .isNotEmpty) {
                                                      for (var element in harkat
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
                              ),
                            );
                          }
                        });

                    ListView.separated(
                      padding: EdgeInsets.all(16),
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: AspectRatio(
                                        aspectRatio: 3,
                                        child: Builder(builder: (context) {
                                          final thumbnail =
                                              harkat[index].thumbnail;
                                          if (thumbnail == null) {
                                            return LoadingWidget();
                                          }
                                          return Image.network(thumbnail.path,
                                              fit: BoxFit.cover);
                                        }),
                                      ),
                                    ),
                                    SizedBox(height: 8),
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
                                        harkat[index].expand.system?.title !=
                                                null
                                            ? Column(
                                                children: [
                                                  SizedBox(height: 4),
                                                  Text(
                                                    harkat[index]
                                                            .expand
                                                            .system
                                                            ?.title ??
                                                        '',
                                                    style: context.anjomanLight,
                                                  ),
                                                ],
                                              )
                                            : SizedBox(),
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
                          SizedBox(height: 16),
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
