import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Data/addDescriptionDataSource.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Features/Basket/Utils/proxydecorator.dart';
import 'package:shahabfit/Features/Daylimeal/Data/add_daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/Daylimeal/models/pdftext_model.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/home_button.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';

class DaylimealScreen extends StatefulWidget {
  final Trainer trainer;

  const DaylimealScreen({super.key, required this.trainer});

  @override
  State<DaylimealScreen> createState() => _DaylimealScreenState();
}

class _DaylimealScreenState extends State<DaylimealScreen> {
  final pdfNameController = TextEditingController();
  final pdfTextController = TextEditingController();
  List<DescriptionModel> descriptionList = [];
  List<List<TextEditingController>> controllers = [
    [TextEditingController()],
    [TextEditingController()],
    [TextEditingController()]
  ];
  List<String> mealWidgets = ['صبحانه', 'ناهار', 'شام'];

  void addMeal() {
    print(controllers);
    setState(() {
      controllers.add([TextEditingController()]);
      switch (mealWidgets.length) {
        case 0:
          mealWidgets.add(replaceFarsiNumber('صبحانه'));
          break;
        case 1:
          mealWidgets.add(replaceFarsiNumber('ناهار'));
          break;
        case 2:
          mealWidgets.add(replaceFarsiNumber('شام'));
          break;
        default:
          mealWidgets.add(
              replaceFarsiNumber('میان وعده ${mealWidgets.length - 3 + 1}'));
      }
    });
  }

  void removeMeal(int mealIndex) {
    setState(() {
      controllers.removeAt(mealIndex);
      mealWidgets.removeAt(mealIndex);
    });
  }

  void addTextField(int mealIndex) {
    setState(() {
      controllers[mealIndex].add(TextEditingController());
    });
  }

  void removeTextField(int mealIndex, int index) {
    setState(() {
      if (controllers[mealIndex].length > 1) {
        controllers[mealIndex].removeAt(index);
      }
    });
  }

  Future<void> pasteFromClipboard(int mealIndex, int index) async {
    ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null) {
      setState(() {
        controllers[mealIndex][index].text += clipboardData.text!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.trainer.daylimeal.isNotEmpty) {
      final daylimealList = List<Daylimeal>.from(
          widget.trainer.daylimeal.map((x) => Daylimeal.fromJson(x)));
      mealWidgets = List.generate(
          daylimealList.length, (index) => daylimealList[index].meal);
      controllers = List.generate(
        daylimealList.length,
        (index) => List.generate(
          daylimealList[index].choices.length,
          (choiceIndex) => TextEditingController(
              text: daylimealList[index].choices[choiceIndex].text),
        ),
      );
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
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: addMeal, child: const Icon(Icons.add)),
            appBar: AppBar(
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Image.asset('images/logotype.png', height: 16),
              actions: [
                const HomeButton(),
                IconButton(
                    onPressed: () async {
                      List<Meal> mealList = List.generate(
                        mealWidgets.length,
                        (mealIndex) => Meal(
                            mealName: mealWidgets[mealIndex],
                            choices: List.generate(
                              controllers[mealIndex].length,
                              (index) => controllers[mealIndex][index].text,
                            )),
                      );
                      await showDialog(
                        context: context,
                        builder: (context) => MobileLayout(
                          child: Dialog(
                            backgroundColor: background,
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.white12),
                                borderRadius: BorderRadius.circular(5)),
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Wrap(
                                  runSpacing: 40,
                                  children: [
                                    StatefulBuilder(
                                        builder: (context, setState) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'انتخاب نام برنامه',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField(
                                              controller: pdfNameController,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                              decoration: const InputDecoration(
                                                  hintText: 'نام برنامه',
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10))),
                                          const SizedBox(height: 20),
                                          // TypeAheadField<DescriptionModel>(
                                          //     controller: pdfTextController,
                                          //     hideOnEmpty: true,
                                          //     suggestionsCallback:
                                          //         (search) async {
                                          //       if (descriptionList.isEmpty) {
                                          //         return descriptionList =
                                          //             descriptionFromJson(
                                          //                 await getDescriptionList(
                                          //                     DescriptionType
                                          //                         .qazae));
                                          //       } else {
                                          //         return descriptionList
                                          //             .where((element) => element
                                          //                 .text
                                          //                 .contains(search))
                                          //             .toList();
                                          //       }
                                          //     },
                                          //     builder: (context, controller,
                                          //         focusNode) {
                                          //       return TextField(
                                          //         controller: controller,
                                          //         focusNode: focusNode,
                                          //         autofocus: true,
                                          //         maxLines: 3,
                                          //         textAlignVertical:
                                          //             TextAlignVertical.top,
                                          //         style: const TextStyle(
                                          //             fontSize: 14,
                                          //             color: Colors.white),
                                          //         decoration:
                                          //             const InputDecoration(
                                          //                 alignLabelWithHint:
                                          //                     true,
                                          //                 contentPadding:
                                          //                     EdgeInsets
                                          //                         .symmetric(
                                          //                             horizontal:
                                          //                                 10,
                                          //                             vertical:
                                          //                                 12),
                                          //                 label: Text(
                                          //                     'توضیحات برنامه'),
                                          //                 labelStyle: TextStyle(
                                          //                     fontSize: 14)),
                                          //       );
                                          //     },
                                          //     itemSeparatorBuilder:
                                          //         (context, index) =>
                                          //             const Divider(height: 2),
                                          //     itemBuilder: (context,
                                          //             description) =>
                                          //         ListTile(
                                          //             dense: true,
                                          //             title:
                                          //                 Text(description.text)),
                                          //     onSelected: (value) =>
                                          //         pdfTextController.text =
                                          //             value.text),
                                        ],
                                      );
                                    }),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () async {
                                            if (!descriptionList.any(
                                                (element) =>
                                                    element.text ==
                                                    pdfTextController.text)) {
                                              addDescription(
                                                  pdfTextController.text,
                                                  DescriptionType.qazae);
                                            }

                                            final t = widget.trainer;
                                            addDaylimeal(
                                              trainer: Trainer(
                                                name: pdfNameController.text,
                                                gender: t.gender,
                                                goal: t.goal,
                                                calories: t.calories,
                                                weight: t.weight,
                                                height: t.height,
                                                wrist: t.wrist,
                                                age: t.age,
                                                protein: t.protein,
                                                carbo: t.carbo,
                                                fat: t.fat,
                                                activity: t.activity,
                                                daylimeal: List.generate(
                                                  mealList.length,
                                                  (index) {
                                                    final meal =
                                                        mealList[index];
                                                    return {
                                                      "meal": meal.mealName,
                                                      "choices": List.generate(
                                                        meal.choices.length,
                                                        (chioceIndex) => {
                                                          "text": meal.choices[
                                                              chioceIndex]
                                                        },
                                                      )
                                                    };
                                                  },
                                                ),
                                              ),
                                            );
                                            context.go(mainPage);
                                          },
                                          child: const Text('ذخیره برنامه')),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save)),
              ],
            ),
            body: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
              proxyDecorator: (child, index, animation) =>
                  proxyDecorator(child, index, animation),
              itemBuilder: (context, mealIndex) {
                String widget = mealWidgets[mealIndex];
                return Column(
                  key: ObjectKey(widget),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction) => removeMeal(mealIndex),
                      background: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          ...controllers[mealIndex]
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            TextEditingController controller = entry.value;
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      index == controllers[mealIndex].length - 1
                                          ? 0
                                          : 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        SizedBox(
                                          height: 80,
                                          child: TextField(
                                            controller: controller,
                                            maxLines: 3,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(color: Colors.white),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.fromLTRB(
                                                      30, 10, 10, 10),
                                              isDense: true,
                                              hintText:
                                                  'انتخاب شماره ${replaceFarsiNumber('${index + 1}')}',
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 10, // مقدار تنظیم فاصله از بالا
                                          left: 7, // فاصله از راست
                                          child: InkWell(
                                            child: const Icon(Icons.paste,
                                                size: 20, color: Colors.white),
                                            onTap: () => pasteFromClipboard(
                                                mealIndex, index),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  index == 0
                                      ? ReorderableDragStartListener(
                                          key: ObjectKey(widget),
                                          index: mealIndex,
                                          child: const Icon(Icons.drag_handle),
                                        )
                                      : SizedBox(
                                          height: 80,
                                          width: 25,
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  padding: EdgeInsets.zero),
                                              onPressed: () => removeTextField(
                                                  mealIndex, index),
                                              child: const Text('|')),
                                        ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 35,
                            child: ElevatedButton(
                                onPressed: () => addTextField(mealIndex),
                                child: const Text('افزودن انتخاب')),
                          )
                        ],
                      ),
                    ),
                    const Divider(height: 30),
                  ],
                );
              },
              itemCount: mealWidgets.length,
              onReorder: (oldIndex, newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                setState(() {
                  final item = mealWidgets.removeAt(oldIndex);
                  final controller = controllers.removeAt(oldIndex);
                  mealWidgets.insert(newIndex, item);
                  controllers.insert(newIndex, controller);
                });
              },
            )));
  }
}
