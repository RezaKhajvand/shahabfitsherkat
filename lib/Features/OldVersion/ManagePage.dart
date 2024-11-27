import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Features/OldVersion/addpage.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/OldVersion/editpage.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/jalasat/jalasat.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/shagerd/shagerd.dart';
import 'package:shahabfit/Features/OldVersion/searchpage.dart';
import 'package:shahabfit/Features/OldVersion/timepage.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Widgets/home_button.dart';
import 'package:shahabfit/main.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';
import 'replacefarsiandenglishnumber.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');
  var jalasatdbox = Hive.box<HiveJalase>('jalasatbox');
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    for (var element in shagerdbox.values) {
      print(DateTime.now().difference(element.registerdate).inDays);
      if (DateTime.now().difference(element.registerdate).inDays >= 40) {
        print(element.name);
        shagerdbox.delete(element.id);
      }
    }
    final List<HiveShagerd> shagerds = shagerdbox.values.toList();
    final List<HiveShagerd> khosusishagerd = [];
    final List<HiveShagerd> monqasishagerd = [];
    for (var element in shagerds) {
      if (element.khosusi) {
        khosusishagerd.add(element);
      }
    }
    for (var element in shagerds) {
      if (element.jalase >= element.plan - 1 ||
          DateTime.now().difference(element.registerdate).inDays > 30) {
        monqasishagerd.add(element);
      }
    }
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: ScaffoldMessenger(
        key: globalKey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          drawer: const CustomDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            actions: [
              const HomeButton(),
              IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => TimePage(),
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => const SearchPage(),
                      ),
                    );

                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ],
            title: Text('حضور و غیاب',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Container(
                height: 60,
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                decoration: ShapeDecoration(
                  color: background,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: borderColor,
                    ),
                    borderRadius: tabBorderRadius,
                  ),
                ),
                child: TabBar(
                  onTap: (value) {
                    controller.jumpTo(0);
                  },
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.all(10),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: primary,
                    borderRadius: tabBorderRadius,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white.withOpacity(0.8),
                  labelStyle: Theme.of(context).textTheme.labelMedium,
                  unselectedLabelStyle: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.w300),
                  tabs: const [
                    Tab(text: 'همه'),
                    Tab(text: 'خصوصی'),
                    Tab(text: 'منقضی'),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              getList(shagerds),
              getList(khosusishagerd),
              getList(monqasishagerd),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primary,
            onPressed: () async {
              bool? resault = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const AddPage(),
                  ));
              if (resault != null && resault) {
                setState(() {});
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Column getList(List<HiveShagerd> shagerds) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
              controller: controller,
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
                    final call = Uri.parse('tel:${shagerds[index].phone}');
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
                                      : shagerds[index].name.substring(0, 1),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: shagerds[index].khosusi ? 30 : 20,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(shagerds[index].name,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
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
                                              'کد : ${shagerds[index].id.toString()}')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            shagerds[index].jalase >=
                                        shagerds[index].plan - 1 ||
                                    DateTime.now()
                                            .difference(
                                                shagerds[index].registerdate)
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

                                if (value == 0) {
                                  bool? resault = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditPage(
                                          shagerd: shagerds[index],
                                          planindex: planindex,
                                          typeindex:
                                              shagerds[index].khosusi == true
                                                  ? 1
                                                  : 0,
                                        ),
                                      ));
                                  if (resault != null && resault) {
                                    setState(() {});
                                  }
                                }
                                if (value == 1) {
                                  await shagerdbox.delete(shagerds[index].id);
                                  setState(() {});
                                }
                                if (value == 2) {
                                  final List<String> planlist = [
                                    '۱۲ جلسه',
                                    '۱۶ جلسه',
                                    '۲۴ جلسه'
                                  ];
                                  // ignore: use_build_context_synchronously
                                  bool? resault = await showModalBottomSheet(
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
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          ),
                                          const SizedBox(height: 30),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: List.generate(
                                                planlist.length,
                                                (planindex) => ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.white),
                                                    onPressed: () async {
                                                      await shagerdbox.put(
                                                          shagerds[index].id,
                                                          HiveShagerd(
                                                              name: shagerds[
                                                                      index]
                                                                  .name,
                                                              phone: shagerds[
                                                                      index]
                                                                  .phone,
                                                              jalase: 0,
                                                              khosusi:
                                                                  shagerds[
                                                                          index]
                                                                      .khosusi,
                                                              workouttime:
                                                                  shagerds[
                                                                          index]
                                                                      .workouttime,
                                                              id: shagerds[
                                                                      index]
                                                                  .id,
                                                              plan: getplan(
                                                                  planindex),
                                                              registerdate:
                                                                  DateTime
                                                                      .now()));
                                                      Navigator.pop(
                                                          context, true);
                                                    },
                                                    child: Text(
                                                        planlist[planindex]))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                  if (resault != null && resault) {
                                    setState(() {});
                                  }
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  value: 0,
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  child: const Text('ویرایش'),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
                                  child: const Text('حذف'),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  textStyle:
                                      Theme.of(context).textTheme.bodySmall,
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
                              format1(shagerds[index].registerdate.toJalali()),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () async {
                                if (shagerds[index].jalase > 0) {
                                  if (jalasatdbox.values
                                      .where((element) =>
                                          element.shagerId ==
                                          shagerds[index].id)
                                      .isNotEmpty) {
                                    var deleteKey = jalasatdbox.values
                                        .where((element) =>
                                            element.shagerId ==
                                            shagerds[index].id)
                                        .last
                                        .key;
                                    await jalasatdbox.delete(deleteKey);
                                  }

                                  shagerds[index].jalase--;
                                  await shagerds[index].save();
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.remove_circle,
                                  color: primary, size: 32),
                            ),
                            Text(
                              replaceFarsiNumber(' ${shagerds[index].jalase} '),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (jalasatdbox.values
                                    .where((element) =>
                                        element.shagerId == shagerds[index].id)
                                    .isNotEmpty) {
                                  if (DateTime.now()
                                          .difference(jalasatdbox.values
                                              .where((element) =>
                                                  element.shagerId ==
                                                  shagerds[index].id)
                                              .last
                                              .jalaseDate)
                                          .inHours >
                                      2) {
                                    await addJalase(shagerds[index]);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    HapticFeedback.mediumImpact();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text('''
          در ۲ ساعت اخیر کلاس ثبت کرده اید
          آیا از افزودن جلسه اطمینان دارید؟
          '''),
                                      action: SnackBarAction(
                                        label: 'بله',
                                        onPressed: () async =>
                                            await addJalase(shagerds[index]),
                                      ),
                                    ));
                                  }
                                } else {
                                  await addJalase(shagerds[index]);
                                }
                              },
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
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemCount: shagerds.length),
        ),
      ],
    );
  }

  addJalase(HiveShagerd shagerds) async {
    if (shagerds.jalase < shagerds.plan) {
      await jalasatdbox.put(
          jalasatdbox.values.isEmpty ? 1 : jalasatdbox.values.last.key + 1,
          HiveJalase(shagerId: shagerds.id, jalaseDate: DateTime.now()));
      //
      shagerds.jalase++;
      await shagerds.save();
      setState(() {});
    }
  }
}

getplan(int index) {
  switch (index) {
    case 0:
      return 12;
    case 1:
      return 16;
    case 2:
      return 24;
  }
}

String format1(Date d) {
  final f = d.formatter;

  return replaceFarsiNumber('${f.wN} ${f.d} ${f.mN} ${f.yyyy}');
}
