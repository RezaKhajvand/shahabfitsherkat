import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:shamsi_date/shamsi_date.dart';

class TarikhBottomSheetContent extends StatefulWidget {
  const TarikhBottomSheetContent({
    super.key,
  });

  @override
  State<TarikhBottomSheetContent> createState() => _OutlinedButtonFieldState();
}

class _OutlinedButtonFieldState extends State<TarikhBottomSheetContent> {
  final List<String> mah = [
    'فروردین',
    'اردیبهشت',
    'خرداد ',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند'
  ];
  List<String> rooz = List.generate(31, (index) => (index + 1).toString());
  final Jalali now = Jalali.now();
  late List<String> sal;
  ScrollController roozcontroller = FixedExtentScrollController();
  ScrollController mahcontroller = FixedExtentScrollController();
  ScrollController salcontroller = FixedExtentScrollController();
  int selectedroozindex = 0;
  int selectedmahindex = 0;
  int selectedsalindex = 0;
  bool gheyre31rooz = false;
  int childcount = 31;
  //سال ماه روز
  List<int> resault = [];
  @override
  void initState() {
    sal = List.generate(10, (index) => (now.year + index).toString());
    getToNowTime();
    super.initState();
  }

  getToNowTime() {
    Future.delayed(
      const Duration(milliseconds: 200),
      () {
        mahcontroller.animateTo((now.month - 1) * 50,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        roozcontroller.animateTo((now.day - 1) * 50,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
        salcontroller.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: mobileWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              if (selectedmahindex >= 0 && selectedmahindex <= 5) {
                childcount = 31;
              }
              if (selectedmahindex >= 6 && selectedmahindex <= 10) {
                childcount = 30;
              }
              if (selectedmahindex == 11) {
                childcount = 29;
              }
              return Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'انتخاب تاریخ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white, letterSpacing: 0),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(16),
                        decoration:
                            BoxDecoration(borderRadius: cardBorderRadius),
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Container(
                                height: 140,
                                alignment: Alignment.bottomCenter,
                                child: ListWheelScrollView.useDelegate(
                                  controller: mahcontroller,
                                  diameterRatio: 3,
                                  overAndUnderCenterOpacity: 0.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  perspective: 0.004,
                                  itemExtent: 50,
                                  magnification: 1.1,
                                  onSelectedItemChanged: (value) {
                                    if (selectedmahindex < value &&
                                        value == 6) {
                                      gheyre31rooz = true;
                                    }
                                    if (selectedmahindex < value &&
                                        value == 11) {
                                      gheyre31rooz = true;
                                    }
                                    if (gheyre31rooz) {
                                      roozcontroller.animateTo(0,
                                          duration:
                                              const Duration(milliseconds: 200),
                                          curve: Curves.ease);
                                    }
                                    setState(() {
                                      selectedmahindex = value;
                                    });
                                    gheyre31rooz = false;
                                  },
                                  useMagnifier: true,
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: mah.length,
                                    builder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                          replaceFarsiNumber(mah[index]),
                                          style: context.anjomanBold.copyWith(
                                              fontWeight:
                                                  index != selectedmahindex
                                                      ? FontWeight.w400
                                                      : FontWeight.w700),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 140,
                                alignment: Alignment.bottomCenter,
                                child: ListWheelScrollView.useDelegate(
                                  controller: roozcontroller,
                                  diameterRatio: 3,
                                  overAndUnderCenterOpacity: 0.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  perspective: 0.004,
                                  itemExtent: 50,
                                  magnification: 1.1,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (value) {
                                    setState(() {
                                      selectedroozindex = value;
                                    });
                                  },
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: childcount,
                                    builder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                          replaceFarsiNumber(rooz[index]),
                                          style: context.anjomanBold.copyWith(
                                              fontWeight:
                                                  index != selectedmahindex
                                                      ? FontWeight.w400
                                                      : FontWeight.w700),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 140,
                                alignment: Alignment.bottomCenter,
                                child: ListWheelScrollView.useDelegate(
                                  controller: salcontroller,
                                  diameterRatio: 3,
                                  overAndUnderCenterOpacity: 0.5,
                                  physics: const FixedExtentScrollPhysics(),
                                  perspective: 0.004,
                                  itemExtent: 50,
                                  magnification: 1.1,
                                  onSelectedItemChanged: (value) {
                                    setState(() {
                                      selectedsalindex = value;
                                    });
                                  },
                                  useMagnifier: true,
                                  childDelegate: ListWheelChildBuilderDelegate(
                                    childCount: sal.length,
                                    builder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: Text(
                                          replaceFarsiNumber(sal[index]),
                                          style: context.anjomanBold.copyWith(
                                              fontWeight:
                                                  index != selectedmahindex
                                                      ? FontWeight.w400
                                                      : FontWeight.w700),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () {
                    resault.add(selectedroozindex + 1);
                    resault.add(selectedmahindex + 1);
                    resault.add(selectedsalindex + now.year);
                    context.pop();
                  },
                  child: const Text('تایید تاریخ')),
            ),
          )
        ],
      ),
    );
  }
}
