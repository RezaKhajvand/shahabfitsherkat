import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/Daylimeal_Screen.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/home_button.dart';

class TrainerScreen extends StatefulWidget {
  const TrainerScreen({super.key});

  @override
  TrainerScreenState createState() => TrainerScreenState();
}

class TrainerScreenState extends State<TrainerScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _wristController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _caloriesController =
      TextEditingController(text: '2000');
  String _selectedGender = 'مرد';
  String? _selectedBodyType;
  double _prefectWeight = 0;
  double _tadilWeight = 0;
  double _bodyTypeFactor = 0;
  double protein = 35.0;
  double carbs = 35.0;
  double fat = 30.0;
  // متغیر برای ذخیره ضریب فعالیت
  double _activityFactor = 1.2;

  // تابع محاسبه کالری
  void _calculateCalories() {
    if (_formKey.currentState!.validate()) {
      final double height = double.parse(_heightController.text);
      final double wrist = double.parse(_wristController.text);
      final double weight = double.parse(_weightController.text);
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
            ((_tadilWeight * 24 * 1 * _activityFactor) * 1.10)
                .toStringAsFixed(0);
      } else {
        _caloriesController.text =
            ((_tadilWeight * 24 * 0.9 * _activityFactor) * 1.10)
                .toStringAsFixed(0);
      }
      setState(() {});
    }
  }

  // افزایش یا کاهش کالری به میزان ۱۰۰
  void _adjustCalories(int amount) {
    setState(() {
      double calories = double.parse(_caloriesController.text);
      calories += amount;
      _caloriesController.text = calories.toStringAsFixed(0);
    });
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
          appBar: AppBar(
            title: const Text('محاسبه کالری'),
            actions: const [
              HomeButton(),
            ],
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                          decoration: const InputDecoration(labelText: 'جنسیت'),
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
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: Colors.white),
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(labelText: 'وزن (کیلوگرم)'),
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
                  TextFormField(
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'سن'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لطفا سن خود را وارد کنید';
                      }
                      return null;
                    },
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
                    }),
                  ),
                  //Here
                  const SizedBox(height: 15),
                  DropdownButtonFormField<double>(
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.white),
                    dropdownColor: Colors.black,
                    value: _activityFactor,
                    decoration:
                        const InputDecoration(labelText: 'میزان فعالیت'),
                    items: const [
                      DropdownMenuItem(
                        value: 1.2,
                        child: Text('فعالیت خیلی کم'),
                      ),
                      DropdownMenuItem(
                        value: 1.375,
                        child: Text('فعالیت کم'),
                      ),
                      DropdownMenuItem(
                        value: 1.55,
                        child: Text('فعالیت متوسط'),
                      ),
                      DropdownMenuItem(
                        value: 1.725,
                        child: Text('فعالیت زیاد'),
                      ),
                      DropdownMenuItem(
                        value: 1.9,
                        child: Text('فعالیت بسیار زیاد'),
                      ),
                    ],
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
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: _calculateCalories,
                            child: const Text('محاسبه کالری')),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: OutlinedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.push(dayliMealPage,
                                    extra: Trainer(
                                      calories: _caloriesController.text,
                                      gender: _selectedGender,
                                      weight: _weightController.text,
                                      height: _heightController.text,
                                      age: _ageController.text,
                                      meal: '3',
                                      carbo: carbs,
                                      fat: fat,
                                      protein: protein,
                                    ));
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
                        _prefectWeight.toStringAsFixed(2),
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
                        _tadilWeight.toStringAsFixed(2),
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
                          controller: _caloriesController,
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class NutritionSlider extends StatefulWidget {
  double protein;
  double carbs;
  double fat;
  final Function(double, double, double) onValuesChanged; // Callback function
  NutritionSlider(
      {super.key,
      required this.protein,
      required this.carbs,
      required this.fat,
      required this.onValuesChanged});

  @override
  NutritionSliderState createState() => NutritionSliderState();
}

class NutritionSliderState extends State<NutritionSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () async {
            final List<double>? resault = await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: background,
              shape: const RoundedRectangleBorder(),
              context: context,
              builder: (context) => const SliderBottomSheet(),
            );
            if (resault != null) {
              setState(() {
                widget.protein = resault[0];
                widget.carbs = resault[1];
                widget.fat = resault[2];
              });
              // Call the callback function to update the parent's state
              widget.onValuesChanged(widget.protein, widget.carbs, widget.fat);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primary)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: primary,
                      radius: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      replaceFarsiNumber(
                          'پروتین: ${widget.protein.toStringAsFixed(0)}%'),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: thumbsecend,
                      radius: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      replaceFarsiNumber(
                          'کربو: ${widget.carbs.toStringAsFixed(0)}%'),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  replaceFarsiNumber('چربی: ${widget.fat.toStringAsFixed(0)}%'),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SliderBottomSheet extends StatefulWidget {
  const SliderBottomSheet({
    super.key,
  });

  @override
  State<SliderBottomSheet> createState() => _SliderBottomSheetState();
}

class _SliderBottomSheetState extends State<SliderBottomSheet> {
  double protein = 35.0;
  double carbs = 35.0;
  double fat = 30.0;

  void _updateValues(double newValue, String type) {
    setState(() {
      if (type == 'protein') {
        protein = newValue;
      } else if (type == 'carbs') {
        carbs = newValue;
      }
      fat = 100 - protein - carbs;

      // اطمینان حاصل کنید که مقادیر کمتر از صفر نمی‌شوند
      if (fat < 0) {
        fat = 0;
        carbs = 100 - protein;
      } else if (carbs < 0) {
        carbs = 0;
        protein = 100 - fat;
      } else if (protein < 0) {
        protein = 0;
        carbs = 100 - fat;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primary)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: primary,
                      radius: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      replaceFarsiNumber(
                          'پروتین: ${protein.toStringAsFixed(0)}%'),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: thumbsecend,
                      radius: 10,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      replaceFarsiNumber('کربو: ${carbs.toStringAsFixed(0)}%'),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  replaceFarsiNumber('چربی: ${fat.toStringAsFixed(0)}%'),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Slider(
              value: protein,
              min: 0,
              max: 100,
              divisions: 20,
              thumbColor: primary,
              activeColor: primary,
              onChanged: (value) {
                _updateValues(value, 'protein');
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Slider(
              value: carbs,
              min: 0,
              max: 100,
              divisions: 20,
              thumbColor: thumbsecend,
              activeColor: thumbsecend,
              onChanged: (value) {
                _updateValues(value, 'carbs');
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => context.pop([protein, carbs, fat]),
                  child: const Text('ذخیره')))
        ],
      ),
    );
  }
}
