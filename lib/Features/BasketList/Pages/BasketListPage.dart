import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Models/OpenBasketModel.dart';
import 'package:shahabfit/Features/Basket/Data/deleteBasketDataSource.dart';
import 'package:shahabfit/Features/BasketList/Data/getBasketListDataSource.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shahabfit/Widgets/home_button.dart';
import 'package:shamsi_date/shamsi_date.dart';

class BasketListPage extends StatefulWidget {
  const BasketListPage({super.key});

  @override
  State<BasketListPage> createState() => _BasketListPageState();
}

class _BasketListPageState extends State<BasketListPage> {
  var now = DateTime.now();
  Future<List<BasketRecord>> getBasketListFuture() async {
    return openBasketFromJson(await getBasketList());
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
        drawer: const CustomDrawer(),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text('لیست برنامه ها',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
          actions: const [HomeButton()],
        ),
        body: FutureBuilder<List<BasketRecord>>(
            future: getBasketListFuture(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var basketList = snapshot.data!;
                return ListView.separated(
                  itemCount: basketList.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => context.push(activitiesPage,
                          extra: basketList[index].id),
                      child: Container(
                          decoration: ShapeDecoration(
                            color: background,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: borderColor),
                                borderRadius: cardBorderRadius),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        basketList[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'تعداد روز : ${replaceFarsiNumber(basketList[index].dayCount.toString())}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  now
                                              .difference(
                                                  basketList[index].updated)
                                              .inDays >=
                                          27
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
                                  const SizedBox(width: 14),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        format2(basketList[index]
                                            .updated
                                            .toJalali()),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        basketList[index].level ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: const Color(0xFF00EFFF),
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
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
                                      icon: const Icon(Icons.delete_outline))
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

String format2(Date d) {
  final f = d.formatter;
  return replaceFarsiNumber('${f.d} / ${f.m} / ${f.yyyy}');
}
