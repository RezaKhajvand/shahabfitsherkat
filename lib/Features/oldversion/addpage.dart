import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/OldVersion/bottomsheet_tarikh.dart';
import 'package:shahabfit/Features/OldVersion/getshomarefrestande.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/Widgets/customlinearloading.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shahabfit/constants/Router.dart';
import 'package:shahabfit/constants/values.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:shamsi_date/shamsi_date.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController namecontroler = TextEditingController();
  final TextEditingController phonecontroler = TextEditingController();
  TextEditingController datecontroller = TextEditingController();

  final List<String> timelist =
      List.generate(24, (index) => (index).toString().padLeft(2, '0'));

  int workouttimeindex = 0;
  int planindex = 0;
  int typeindex = 0;
  List<String> planlist = ['12', '16', '24'];
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
        await customModalSheet(context, const TarikhBottomSheetContent());
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
    roozcontroller = FixedExtentScrollController(initialItem: workouttimeindex);
    var registerdate = Jalali.now();
    date = [registerdate.day, registerdate.month, registerdate.year];
    datecontroller.text = replaceFarsiNumber(
        '${date!.first}  ${mah[date![1] - 1]}  ${date!.last}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Router.neglect(context, () => context.go(managePage)),
            icon: Icon(Icons.close)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Text(
          'افزودن شاگرد',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFF141414),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              TextFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'لطفا نام شاگرد را وارد کنید';
                    } else {
                      if (value.isEmpty) {
                        return 'لطفا نام شاگرد را وارد کنید';
                      }
                    }
                    return null;
                  },
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
                        label:
                            Text('${replaceFarsiNumber(planlist[index])} جلسه'),
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
                            print('workouttimeindex ====> $workouttimeindex');
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
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'تاریخ عضویت',
                    style: context.anjomanLight,
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
              BlocConsumer<ShagerdBloc, ShagerdState>(
                listener: (context, state) {
                  if (state is ShagerdLoaded) {
                    Router.neglect(context, () => context.go(managePage));
                  }
                  if (state is ShagerdError) {
                    getErrorSnackbar(context, state.message);
                  }
                },
                builder: (context, state) {
                  return AnimatedContainer(
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 300),
                    width: double.infinity,
                    height: state is ShagerdLoading
                        ? animatedButtonHeight
                        : fixButtonHeight,
                    child: state is ShagerdLoading
                        ? CustomLinearLoading()
                        : ElevatedButton(
                            onPressed: () async {
                              if (formGlobalKey.currentState!.validate()) {
                                BlocProvider.of<ShagerdBloc>(context)
                                    .add(CreateShagerdEvent(
                                        shagerd: Shagerd(
                                  user: AuthManager.readUser() ?? '',
                                  name: namecontroler.text,
                                  jalase: 0,
                                  phone:
                                      replaceEnglishNumber(phonecontroler.text),
                                  khosusi: typeindex != 0,
                                  workouttime: timelist[workouttimeindex],
                                  plan: getplan(),
                                  registerdate: Jalali(
                                    date![2],
                                    date![1],
                                    date![0],
                                  ).toUtcDateTime(),
                                )));
                              }
                            },
                            child: const Text('افزودن')),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  String getplan() {
    switch (planindex) {
      case 0:
        return '12';
      case 1:
        return '16';
      case 2:
        return '24';
      default:
        return '12';
    }
  }
}
