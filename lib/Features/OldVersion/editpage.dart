import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shahabfit/Features/OldVersion/bottomsheet_tarikh.dart';
import 'package:shahabfit/Features/OldVersion/getshomarefrestande.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/shagerd/shagerd.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
import 'package:shamsi_date/shamsi_date.dart';

class EditPage extends StatefulWidget {
  final HiveShagerd shagerd;
  int planindex;
  int typeindex;

  EditPage(
      {super.key,
      required this.planindex,
      required this.typeindex,
      required this.shagerd});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController phonecontroler = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  final List<String> timelist =
      List.generate(18, (index) => (index + 6).toString());

  late int workouttimeindex;
  var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');
  late int planindex;
  late int typeindex;
  List<String> planlist = ['۱۲ جلسه', '۱۶ جلسه', '۲۴ جلسه'];
  List<String> typelist = ['معمولی', 'خصوصی'];
  final formGlobalKey = GlobalKey<FormState>();
  late ScrollController roozcontroller;
  String tarikhhinttext = 'تاریخ عضویت';
  List<int>? date;
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
  tarikhErsal() async {
    var resault =
        await getBottomSheet(const TarikhBottomSheetContent(), context);
    if (resault != null) {
      date = resault;
      print(date);
      datecontroller.text = replaceFarsiNumber(
          '${resault.first}  ${mah[resault[1] - 1]}  ${resault.last}');
    }
  }

  @override
  void initState() {
    super.initState();
    planindex = widget.planindex;
    typeindex = widget.typeindex;
    namecontroler.text = widget.shagerd.name;
    phonecontroler.text = widget.shagerd.phone;
    workouttimeindex = int.parse(widget.shagerd.workouttime) - 12;
    roozcontroller = FixedExtentScrollController(initialItem: workouttimeindex);
    var registerdate = widget.shagerd.registerdate.toJalali();
    date = [registerdate.day, registerdate.month, registerdate.year];
    datecontroller.text = replaceFarsiNumber(
        '${date!.first}  ${mah[date![1] - 1]}  ${date!.last}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'ویرایش شاگرد',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFF141414),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Form(
          key: formGlobalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'لطفا نام شاگرد را وارد کنید';
                    } else {
                      if (value.isEmpty) {
                        return 'لطفا نام شاگرد را وارد کنید';
                      } else if (value.isNotEmpty) {
                        for (var element in shagerdbox.values.toList()) {
                          if (element.name == value &&
                              element.name != widget.shagerd.name) {
                            return 'از نام تکراری استفاده کرده اید';
                          }
                        }
                      }
                    }
                    return null;
                  },
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: namecontroler,
                  style: const TextStyle(color: Colors.white, letterSpacing: 0),
                  decoration:
                      const InputDecoration(labelText: 'نام و نام خانوادگی')),
              const SizedBox(height: 20),
              TextFormField(
                  inputFormatters: [FarsiInputFormatter()],
                  validator: (value) {
                    if (value == null) {
                      return 'لطفا تلفن شاگرد را وارد کنید';
                    } else {
                      if (value.isEmpty) {
                        return 'لطفا تلفن شاگرد را وارد کنید';
                      }
                    }
                    return null;
                  },
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  controller: phonecontroler,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white, letterSpacing: 4),
                  decoration: const InputDecoration(labelText: 'شماره تلفن')),
              const SizedBox(height: 30),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'انتخاب پلن',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ChoiceChip(
                        onSelected: (value) {
                          setState(() {
                            planindex = index;
                          });
                        },
                        label: Text(planlist[index]),
                        selected: index == planindex),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: planlist.length),
              ),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'نوع شاگرد',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ChoiceChip(
                        onSelected: (value) {
                          setState(() {
                            typeindex = index;
                          });
                        },
                        label: Text(typelist[index]),
                        selected: index == typeindex),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: typelist.length),
              ),
              const SizedBox(height: 10),
              typeindex == 1
                  ? SizedBox(
                      height: 60,
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: ListWheelScrollView.useDelegate(
                          controller: roozcontroller,
                          diameterRatio: 4,
                          overAndUnderCenterOpacity: 0.5,
                          physics: const FixedExtentScrollPhysics(),
                          perspective: 0.004,
                          itemExtent: 50,
                          magnification: 1.1,
                          useMagnifier: true,
                          onSelectedItemChanged: (value) {
                            workouttimeindex = value;
                            print(workouttimeindex);
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: timelist.length,
                            builder: (context, index) => Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: RotatedBox(
                                quarterTurns: 1,
                                child: Text(
                                  replaceFarsiNumber(
                                      timelist[index].toString()),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: index != workouttimeindex
                                          ? FontWeight.w400
                                          : FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'تاریخ عضویت',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(height: 10),
              getCliclableTextfield(
                'لطفا تاریخ عضویت را مشخص نمایید',
                datecontroller,
                tarikhhinttext,
                tarikhErsal,
                false,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formGlobalKey.currentState!.validate()) {
                        await shagerdbox.put(
                            widget.shagerd.id,
                            HiveShagerd(
                                name: namecontroler.text,
                                phone: phonecontroler.text,
                                jalase: widget.shagerd.jalase,
                                khosusi: typeindex != 0,
                                workouttime: timelist[workouttimeindex],
                                id: widget.shagerd.id,
                                plan: getplan(),
                                registerdate: Jalali(
                                  date![2],
                                  date![1],
                                  date![0],
                                ).toDateTime()));

                        Navigator.pop(context, true);
                      }
                    },
                    child: const Text('ویرایش')),
              )
            ],
          ),
        ),
      ),
    );
  }

  getplan() {
    switch (planindex) {
      case 0:
        return 12;
      case 1:
        return 16;
      case 2:
        return 24;
    }
  }
}