import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Features/Daylimeal/Data/add_daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/Data/update_daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/bloc/daylimeal_list_bloc.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/Daylimeal/utils/activityfactor.dart';
import 'package:shahabfit/Features/Daylimeal/utils/getinputformatter.dart';
import 'package:shahabfit/Features/Daylimeal/widgets/sliderwidget.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/utils/texttheme.dart';

class TrainerScreen extends StatefulWidget {
  final String? barnameId;
  const TrainerScreen({super.key, this.barnameId});

  @override
  TrainerScreenState createState() => TrainerScreenState();
}

class TrainerScreenState extends State<TrainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<ActivityFactor> activityList = [
    ActivityFactor(title: "فعالیت خیلی کم", factor: 1.2),
    ActivityFactor(title: 'فعالیت کم', factor: 1.375),
    ActivityFactor(title: 'فعالیت متوسط', factor: 1.55),
    ActivityFactor(title: 'فعالیت زیاد', factor: 1.725),
    ActivityFactor(title: 'فعالیت بسیار زیاد', factor: 1.9),
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _wristController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _caloriesController =
      TextEditingController(text: replaceFarsiNumber('2000'));
  String _selectedGender = 'مرد';
  String? _selectedBodyType;
  double _prefectWeight = 0;
  double _tadilWeight = 0;
  double _bodyTypeFactor = 0;
  double protein = 35.0;
  double carbs = 35.0;
  double fat = 30.0;
  // متغیر برای ذخیره ضریب فعالیت
  late ActivityFactor _activityFactor;
  int _typeIndex = 0;
  List<Daylimeal> daylimeal = [];
  final goalList = const ['کاهش وزن', 'تثبیت وزن', 'افزایش وزن'];
  // تابع محاسبه کالری
  void _calculateCalories() {
    if (_formKey.currentState!.validate()) {
      final double height =
          double.parse(replaceEnglishNumber(_heightController.text));
      final double wrist =
          double.parse(replaceEnglishNumber(_wristController.text));
      final double weight =
          double.parse(replaceEnglishNumber(_weightController.text));
      _bodyTypeFactor = height / wrist;

      // محاسبه وزن ایده آل
      if (_selectedGender == 'مرد') {
        _prefectWeight = height - 102;
        if (_bodyTypeFactor > 10.4) {
          _selectedBodyType = 'کوچک';
        } else if (9.6 <= _bodyTypeFactor && _bodyTypeFactor <= 10.4) {
          _selectedBodyType = 'متوسط';
        } else {
          _selectedBodyType = 'بزرگ';
        }
      } else {
        _prefectWeight = ((height - 152) * .9) + 45.5;
        if (_bodyTypeFactor > 11) {
          _selectedBodyType = 'کوچک';
        } else if (10.1 <= _bodyTypeFactor && _bodyTypeFactor <= 11) {
          _selectedBodyType = 'متوسط';
        } else {
          _selectedBodyType = 'بزرگ';
        }
      }

      if (_selectedBodyType == 'کوچک') {
        _prefectWeight = _prefectWeight - (.1 * _prefectWeight);
      } else if (_selectedBodyType == 'متوسط') {
        _prefectWeight = _prefectWeight;
      } else {
        _prefectWeight = _prefectWeight + (.1 * _prefectWeight);
      }
      if (weight > _prefectWeight) {
        _tadilWeight = _prefectWeight + ((weight - _prefectWeight) * .25);
      } else {
        _tadilWeight = _prefectWeight - ((_prefectWeight - weight) * .25);
      }
      if (_selectedGender == 'مرد') {
        _caloriesController.text =
            ((_tadilWeight * 24 * 1 * _activityFactor.factor) * 1.10)
                .toStringAsFixed(0);
      } else {
        _caloriesController.text =
            ((_tadilWeight * 24 * 0.9 * _activityFactor.factor) * 1.10)
                .toStringAsFixed(0);
      }
      _caloriesController.text = replaceFarsiNumber(_caloriesController.text);
      setState(() {});
    }
  }

  // افزایش یا کاهش کالری به میزان ۱۰۰
  void _adjustCalories(int amount) {
    setState(() {
      double calories =
          double.parse(replaceEnglishNumber(_caloriesController.text));
      calories += amount;
      _caloriesController.text =
          replaceFarsiNumber(calories.toStringAsFixed(0));
    });
  }

  @override
  void initState() {
    super.initState();
    _activityFactor = activityList[2];
    if (widget.barnameId != null) {
      BlocProvider.of<DaylimealListBloc>(context)
          .add(DaylimealListEvent(barnameId: widget.barnameId));
    }
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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: const Text('محاسبه کالری')),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<DaylimealListBloc, DaylimealListState>(
                builder: (context, state) {
                  print(state);
                  if (state is DaylimealListLoaded) {
                    final trainer = state.daylimelaList.first;

                    _nameController.text = trainer.name;
                    _heightController.text =
                        replaceFarsiNumber(trainer.height.toString());
                    _weightController.text =
                        replaceFarsiNumber(trainer.weight.toString());
                    _wristController.text =
                        replaceFarsiNumber(trainer.wrist.toString());
                    _ageController.text =
                        replaceFarsiNumber(trainer.age.toString());
                    _caloriesController.text =
                        replaceFarsiNumber(trainer.calories.toString());
                    _selectedGender = trainer.gender;
                    protein = trainer.protein.toDouble();
                    carbs = trainer.carbo.toDouble();
                    fat = trainer.fat.toDouble();
                    _activityFactor = activityList.firstWhere(
                      (element) => element.title == trainer.activity,
                    );
                    daylimeal = trainer.daylimeal;
                  }
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              textDirection: TextDirection.rtl,
                              style: context.anjomanLight,
                              controller: _nameController,
                              decoration:
                                  const InputDecoration(labelText: 'نام'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DropdownButtonFormField<int>(
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              dropdownColor: Colors.black,
                              value: _typeIndex,
                              decoration:
                                  const InputDecoration(labelText: 'هدف'),
                              items: List.generate(
                                goalList.length,
                                (index) => DropdownMenuItem(
                                    value: index, child: Text(goalList[index])),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _typeIndex = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'لطفا هدف خود را انتخاب کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<ActivityFactor>(
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              dropdownColor: Colors.black,
                              value: _activityFactor,
                              decoration: const InputDecoration(
                                  labelText: 'میزان فعالیت'),
                              items: List.generate(
                                activityList.length,
                                (index) => DropdownMenuItem(
                                  value: activityList[index],
                                  child: Text(activityList[index].title),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _activityFactor = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'لطفا میزان فعالیت خود را انتخاب کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                              inputFormatters: getInputFormatter,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              controller: _ageController,
                              keyboardType: TextInputType.number,
                              decoration:
                                  const InputDecoration(labelText: 'سن'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              dropdownColor: Colors.black,
                              value: _selectedGender,
                              decoration:
                                  const InputDecoration(labelText: 'جنسیت'),
                              items: ['مرد', 'زن'].map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'لطفا جنسیت خود را انتخاب کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              inputFormatters: getInputFormatter,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              controller: _heightController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'قد (سانتی‌متر)'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'لطفا قد خود را وارد کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                              inputFormatters: getInputFormatter,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              controller: _weightController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'وزن (کیلوگرم)'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'لطفا وزن خود را وارد کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.left,
                              inputFormatters: getInputFormatter,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: Colors.white),
                              controller: _wristController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  labelText: 'دور مچ (سانتی‌متر)'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'لطفا دور مچ خود را وارد کنید';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      NutritionSlider(
                          carbs: carbs,
                          protein: protein,
                          fat: fat,
                          onValuesChanged: (p0, p1, p2) => setState(() {
                                protein = p0;
                                carbs = p1;
                                fat = p2;
                              })),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                onPressed: _calculateCalories,
                                child: const Text('محاسبه کالری')),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _calculateCalories();
                                    final trainer = Trainer(
                                      name: _nameController.text,
                                      goal: goalList[_typeIndex],
                                      wrist: int.parse(replaceEnglishNumber(
                                          _wristController.text)),
                                      activity: _activityFactor.title,
                                      calories: int.parse(replaceEnglishNumber(
                                          _caloriesController.text)),
                                      gender: _selectedGender,
                                      weight: int.parse(replaceEnglishNumber(
                                          _weightController.text)),
                                      height: int.parse(replaceEnglishNumber(
                                          _heightController.text)),
                                      age: int.parse(replaceEnglishNumber(
                                          _ageController.text)),
                                      carbo: carbs.toInt(),
                                      fat: fat.toInt(),
                                      protein: protein.toInt(),
                                    );
                                    String id = '';
                                    if (widget.barnameId == null) {
                                      trainer.daylimeal = [];
                                      final record = Item.fromJson(json.decode(
                                          await addDaylimeal(
                                              trainer: trainer)));
                                      id = record.id;
                                    } else {
                                      id = widget.barnameId!;
                                      await updateDaylimeal(
                                          id: id, trainer: trainer);
                                    }
                                    context.go('$dayliMealPage?barnameId=$id');
                                  }
                                },
                                child: const Text('برنامه غذایی')),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'وزن ایده آل',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            replaceFarsiNumber(
                                _prefectWeight.toStringAsFixed(2)),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'وزن تعدیل شده',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            replaceFarsiNumber(_tadilWeight.toStringAsFixed(2)),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'نوع استخوان بندی',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            _selectedBodyType ?? 'اطلاعات را وارد کنید',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => _adjustCalories(-100),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              textDirection: TextDirection.ltr,
                              controller: _caloriesController,
                              inputFormatters: getInputFormatter,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => _adjustCalories(100),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
