import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/BasketList/Data/copyAllBasketDataSource.dart';
import 'package:shahabfit/Utils/fotmat2.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/constants/Router.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/Basket/Models/OpenBasketModel.dart';
import 'package:shahabfit/Features/Basket/Data/deleteBasketDataSource.dart';
import 'package:shahabfit/Features/BasketList/Data/getBasketListDataSource.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shamsi_date/shamsi_date.dart';

class BasketListPage extends StatefulWidget {
  const BasketListPage({super.key});

  @override
  State<BasketListPage> createState() => _BasketListPageState();
}

class _BasketListPageState extends State<BasketListPage> {
  var now = DateTime.now();
  Future<List<Basket>> getBasketListFuture() async {
    return basketListFromJson(await getBasketList());
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () => context.go(createTamrinPage),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text('تمرینی', style: context.anjomanBlack),
          actionsPadding: EdgeInsets.only(left: 10),
          actions: [
            IconButton(
              onPressed: () => context.go(systemPage),
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: FutureBuilder<List<Basket>>(
            future: getBasketListFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var basketList = snapshot.data!;
                return ListView.separated(
                  padding: EdgeInsets.all(20),
                  itemCount: basketList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.go(
                            '$activitiesPage?basketId=${basketList[index].id}');
                      },
                      child: Container(
                          decoration: ShapeDecoration(
                            color: background,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: borderColor),
                                borderRadius: cardBorderRadius),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            basketList[index].name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.white),
                                          ),
                                          SizedBox(width: 10),
                                          now
                                                      .difference(
                                                          basketList[index]
                                                              .updated)
                                                      .inDays >=
                                                  27
                                              ? Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8,
                                                      vertical: 5),
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color:
                                                        const Color(0xFF00EFFF),
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'تعداد روز : ${replaceFarsiNumber(basketList[index].dayCount.toString())}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                    onPressed: () async {
                                      await copyAllBasket(basketList[index].id);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.copy),
                                  ),
                                  IconButton(
                                    onPressed: () => context.push(
                                        '$tamrinViewPage?basketId=${basketList[index].id}&tabIndex=0'),
                                    icon: Icon(Icons.share),
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        customModalSheet(
                                          context,
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                  'آیا از حذف این برنامه اطمینان دارید',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(height: 20),
                                                Row(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  children: [
                                                    Expanded(
                                                        child: ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              context.pop();
                                                              await deleteBasket(
                                                                  record: basketList[
                                                                          index]
                                                                      .id);
                                                              setState(() => basketList
                                                                  .removeWhere((element) =>
                                                                      element
                                                                          .id ==
                                                                      basketList[
                                                                              index]
                                                                          .id));
                                                            },
                                                            child: const Text(
                                                                'بله'))),
                                                    const SizedBox(width: 20),
                                                    Expanded(
                                                      child: OutlinedButton(
                                                        onPressed: () =>
                                                            context.pop(),
                                                        child: const Text(
                                                            'انصراف'),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        size: 30,
                                      )),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    basketList[index].level,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: const Color(0xFF00EFFF),
                                        ),
                                  ),
                                  Text(
                                    format2(
                                        basketList[index].updated.toJalali()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 14),
                );
              }

              return const LoadingWidget();
            }),
      ),
    );
  }
}
