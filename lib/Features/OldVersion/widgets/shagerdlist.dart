import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Features/OldVersion/riverpod/shagerd_riverpod.dart';
import 'package:shahabfit/Features/OldVersion/utils/formatdatetime.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';

class ShagerdList extends ConsumerWidget {
  const ShagerdList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shagerdList = ref.watch(shagerdProvider);
    return shagerdList.when(
        data: (shagerds) => Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                  child: ListView.separated(
                      // controller: controller,
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
                          confirmDismiss: (direction) async {
                            return false;
                          },
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 16, 16, 4),
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
                                            fontSize: shagerds[index].khosusi
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
                                                          .withOpacity(0.6))),
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
                                                shagerds[index].plan - 1 ||
                                            DateTime.now()
                                                    .difference(shagerds[index]
                                                        .registerdate)
                                                    .inDays >
                                                30
                                        ? Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 5),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: const Color(0xFF00EFFF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: tabBorderRadius,
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
                                              padding: const EdgeInsets.all(20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    'انتخاب پلن تمدید',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                  const SizedBox(height: 30),
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
                                                                style: ElevatedButton
                                                                    .styleFrom(
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
                                    // IconButton(
                                    //   onPressed: () async {
                                    //     if (shagerds[index].jalase > 0) {
                                    //       if (jalasatdbox.values
                                    //           .where((element) =>
                                    //               element.shagerId ==
                                    //               shagerds[index].id)
                                    //           .isNotEmpty) {
                                    //         var deleteKey = jalasatdbox.values
                                    //             .where((element) =>
                                    //                 element.shagerId ==
                                    //                 shagerds[index].id)
                                    //             .last
                                    //             .key;
                                    //         await jalasatdbox.delete(deleteKey);
                                    //       }
                                    //       shagerds[index].jalase--;
                                    //       await shagerds[index].save();
                                    //       setState(() {});
                                    //     }
                                    //   },
                                    //   icon: const Icon(Icons.remove_circle,
                                    //       color: primary, size: 32),
                                    // ),

                                    Text(
                                      replaceFarsiNumber(
                                          ' ${shagerds[index].jalase} '),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    //                           IconButton(
                                    //                             onPressed: () async {
                                    //                               if (jalasatdbox.values
                                    //                                   .where((element) =>
                                    //                                       element.shagerId ==
                                    //                                       shagerds[index].id)
                                    //                                   .isNotEmpty) {
                                    //                                 if (DateTime.now()
                                    //                                         .difference(jalasatdbox.values
                                    //                                             .where((element) =>
                                    //                                                 element.shagerId ==
                                    //                                                 shagerds[index].id)
                                    //                                             .last
                                    //                                             .jalaseDate)
                                    //                                         .inHours >
                                    //                                     2) {
                                    //                                   await addJalase(shagerds[index]);
                                    //                                 } else {
                                    //                                   ScaffoldMessenger.of(context)
                                    //                                       .clearSnackBars();
                                    //                                   HapticFeedback.mediumImpact();
                                    //                                   ScaffoldMessenger.of(context)
                                    //                                       .showSnackBar(SnackBar(
                                    //                                     content: const Text('''
                                    // در ۲ ساعت اخیر کلاس ثبت کرده اید
                                    // آیا از افزودن جلسه اطمینان دارید؟
                                    // '''),
                                    //                                     action: SnackBarAction(
                                    //                                       label: 'بله',
                                    //                                       onPressed: () async =>
                                    //                                           await addJalase(
                                    //                                               shagerds[index]),
                                    //                                     ),
                                    //                                   ));
                                    //                                 }
                                    //                               } else {
                                    //                                 await addJalase(shagerds[index]);
                                    //                               }
                                    //                             },
                                    //                             icon: const Icon(Icons.add_circle,
                                    //                                 color: primary, size: 32),
                                    //                           ),
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
              ],
            ),
        error: (error, stackTrace) => Center(
                child: Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
        loading: () => Center(child: CircularProgressIndicator()));
  }
}
