import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/updateshagerd/update_shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Features/oldversion/utils/formatdatetime.dart';
import 'package:shahabfit/Features/oldversion/utils/handleexception.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';

class ShagerdList extends StatefulWidget {
  final ScrollController controller;
  const ShagerdList({super.key, required this.controller});

  @override
  State<ShagerdList> createState() => _ShagerdListState();
}

class _ShagerdListState extends State<ShagerdList> {
  fetchShagerdList() => context.read<ShagerdBloc>().add(FetchShagerdEvent());

  @override
  void initState() {
    super.initState();
    fetchShagerdList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateShagerdBloc, UpdateShagerdState>(
      listener: (context, updateState) {
        if (updateState is UpdateShagerdError) {
          getErrorSnackbar(context, updateState.message,
              action: updateState.shagerd != null
                  ? SnackBarAction(
                      label: 'بله',
                      onPressed: () async => context
                          .read<UpdateShagerdBloc>()
                          .add(UpdateShagerdEvent(
                              shagerd: updateState.shagerd!,
                              action: UpdateAction.increaseDirectly)),
                    )
                  : null);
        }
      },
      builder: (context, state) {
        return BlocBuilder<ShagerdBloc, ShagerdState>(
          builder: (context, state) {
            if (state is ShagerdError) {
              return Center(
                  child: Text(
                handleException(state.message),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ));
            }
            if (state is ShagerdLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ShagerdLoaded) {
              final shagerds = state.shagerdList;
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'تعداد :',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${replaceFarsiNumber(shagerds.length.toString())}  نفر',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => fetchShagerdList(),
                      child: ListView.separated(
                          controller: widget.controller,
                          cacheExtent: 80,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
                          itemBuilder: (context, index) {
                            return Dismissible(
                              direction: DismissDirection.startToEnd,
                              background: Container(
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: cardBorderRadius,
                                ),
                                padding: const EdgeInsets.only(right: 50),
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.call),
                              ),
                              key: Key(index.toString()),
                              onUpdate: (details) async {
                                final call =
                                    Uri.parse('tel:${shagerds[index].phone}');
                                if (details.progress == 1) {
                                  if (await canLaunchUrl(call)) {
                                    launchUrl(call);
                                  } else {
                                    print('مشکل در برقراری تماس');
                                  }
                                }
                              },
                              confirmDismiss: (direction) async => false,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 16, 4),
                                decoration: ShapeDecoration(
                                  color: background,
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      color: borderColor,
                                    ),
                                    borderRadius: cardBorderRadius,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF2D2D2D),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: cardBorderRadius,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                              shagerds[index].khosusi
                                                  ? '💎'
                                                  : shagerds[index]
                                                      .name
                                                      .substring(0, 1),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize:
                                                    shagerds[index].khosusi
                                                        ? 30
                                                        : 20,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(shagerds[index].name,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                            const SizedBox(height: 4),
                                            RichText(
                                              text: TextSpan(
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                                children: [
                                                  TextSpan(
                                                      text: replaceFarsiNumber(
                                                          '${shagerds[index].plan} جلسه'),
                                                      style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.6))),
                                                  const TextSpan(text: ' ⚡ '),
                                                  TextSpan(
                                                      text: replaceFarsiNumber(
                                                          'کد : ${shagerds[index].shagerdId.toString()}')),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        shagerds[index].jalase >=
                                                    int.parse(shagerds[index]
                                                            .plan) -
                                                        1 ||
                                                DateTime.now()
                                                        .difference(
                                                            shagerds[index]
                                                                .registerdate)
                                                        .inDays >
                                                    30
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 5),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF00EFFF),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        tabBorderRadius,
                                                  ),
                                                ),
                                                child: const Text(
                                                  'منقضی',
                                                  style: TextStyle(
                                                    color: background,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              )
                                            : const SizedBox(),
                                        PopupMenuButton(
                                          color: Colors.white,
                                          onSelected: (value) async {
                                            var plan = shagerds[index].plan;
                                            late int planindex;

                                            switch (plan) {
                                              case 12:
                                                planindex = 0;
                                              case 16:
                                                planindex = 1;
                                              case 24:
                                                planindex = 2;
                                            }

                                            // if (value == 0) {
                                            //   bool? resault = await Navigator.push(
                                            //       context,
                                            //       MaterialPageRoute(
                                            //         builder: (context) => EditPage(
                                            //           shagerd: shagerds[index],
                                            //           planindex: planindex,
                                            //           typeindex:
                                            //               shagerds[index].khosusi ==
                                            //                       true
                                            //                   ? 1
                                            //                   : 0,
                                            //         ),
                                            //       ));
                                            //   if (resault == true) {
                                            //     setState(() {});
                                            //   }
                                            // }
                                            // if (value == 1) {
                                            //   await shagerdbox
                                            //       .delete(shagerds[index].id);
                                            //   setState(() {});
                                            // }
                                            if (value == 2) {
                                              final List<String> planlist = [
                                                '۱۲ جلسه',
                                                '۱۶ جلسه',
                                                '۲۴ جلسه'
                                              ];
                                              // ignore: use_build_context_synchronously
                                              bool? resault =
                                                  await showModalBottomSheet(
                                                context: context,
                                                builder: (context) => Container(
                                                  color: background,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        'انتخاب پلن تمدید',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      const SizedBox(
                                                          height: 30),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: List.generate(
                                                            planlist.length,
                                                            (planindex) =>
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .white),
                                                                    onPressed:
                                                                        () async {
                                                                      // await shagerdbox.put(
                                                                      //     shagerds[
                                                                      //             index]
                                                                      //         .id,
                                                                      //     HiveShagerd(
                                                                      //         name: shagerds[index]
                                                                      //             .name,
                                                                      //         phone: shagerds[index]
                                                                      //             .phone,
                                                                      //         jalase:
                                                                      //             0,
                                                                      //         khosusi: shagerds[index]
                                                                      //             .khosusi,
                                                                      //         workouttime: shagerds[index]
                                                                      //             .workouttime,
                                                                      //         id: shagerds[index]
                                                                      //             .id,
                                                                      //         plan: getplan(
                                                                      //             planindex),
                                                                      //         registerdate:
                                                                      //             DateTime.now()));
                                                                      Navigator.pop(
                                                                          context,
                                                                          true);
                                                                    },
                                                                    child: Text(
                                                                        planlist[
                                                                            planindex]))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                              if (resault == true) {
                                                // setState(() {});
                                              }
                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 0,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              child: const Text('ویرایش'),
                                            ),
                                            PopupMenuItem(
                                              value: 1,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              child: const Text('حذف'),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                              child: const Text('تمدید'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Text(
                                          format1(shagerds[index]
                                              .registerdate
                                              .toJalali()),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () => context
                                              .read<UpdateShagerdBloc>()
                                              .add(UpdateShagerdEvent(
                                                  shagerd: shagerds[index],
                                                  action:
                                                      UpdateAction.decrease)),
                                          icon: const Icon(Icons.remove_circle,
                                              color: primary, size: 32),
                                        ),
                                        state is! UpdateShagerdLoading
                                            ? Text(
                                                replaceFarsiNumber(
                                                    ' ${shagerds[index].jalase} '),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            : SizedBox(
                                                height: 16,
                                                width: 16,
                                                child:
                                                    CircularProgressIndicator()),
                                        IconButton(
                                          onPressed: () => context
                                              .read<UpdateShagerdBloc>()
                                              .add(UpdateShagerdEvent(
                                                  shagerd: shagerds[index],
                                                  action:
                                                      UpdateAction.increase)),
                                          icon: const Icon(Icons.add_circle,
                                              color: primary, size: 32),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 14),
                          itemCount: shagerds.length),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        );
      },
    );
  }
}
