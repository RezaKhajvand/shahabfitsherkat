// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';

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
