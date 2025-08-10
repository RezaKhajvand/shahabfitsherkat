import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/proxydecorator.dart';
import 'package:shahabfit/Features/Daylimeal/Data/update_daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/bloc/daylimeal_list_bloc.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/constants/Router.dart';
import 'package:shahabfit/constants/colors.dart';

class DaylimealScreen extends StatefulWidget {
  final String barnameId;

  const DaylimealScreen({super.key, required this.barnameId});

  @override
  DaylimealScreenState createState() => DaylimealScreenState();
}

class DaylimealScreenState extends State<DaylimealScreen> {
  Item? trainer;
  final pdfNameController = TextEditingController();
  final pdfTextController = TextEditingController();
  List<DescriptionModel> descriptionList = [];
  List<List<TextEditingController>> controllers = [
    [TextEditingController()],
    [TextEditingController()],
    [TextEditingController()]
  ];
  List<String> mealWidgets = ['صبحانه', 'ناهار', 'شام'];
  bool initialized = false;

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
    BlocProvider.of<DaylimealListBloc>(context)
        .add(DaylimealListEvent(barnameId: widget.barnameId));
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
              backgroundColor: background,
              actionsPadding: EdgeInsets.only(left: 10),
              title: Text('وعده ها'),
              actions: [
                IconButton(
                    onPressed: () => updateDaylimeal(
                        trainer: Trainer(
                            daylimeal: List.generate(
                          controllers.length,
                          (index) => Map.from(
                            {
                              "choices": List.generate(
                                controllers[index].length,
                                (a) => {"text": controllers[index][a].text},
                              ),
                              "meal": mealWidgets[index]
                            },
                          ),
                        )),
                        id: widget.barnameId),
                    icon: Icon(Icons.save)),
                IconButton(
                    onPressed: () => context
                        .go('$dayliViewPage?basketId=${widget.barnameId}'),
                    icon: Icon(Icons.preview)),
              ],
            ),
            body: BlocBuilder<DaylimealListBloc, DaylimealListState>(
              builder: (context, state) {
                if (state is DaylimealListLoaded && !initialized) {
                  trainer = state.daylimelaList.first;
                  if (trainer != null && trainer!.daylimeal.isNotEmpty) {
                    final daylimealList = trainer!.daylimeal;
                    mealWidgets = List.generate(daylimealList.length,
                        (index) => daylimealList[index].meal);
                    controllers = List.generate(
                      daylimealList.length,
                      (index) => List.generate(
                        daylimealList[index].choices.length,
                        (choiceIndex) => TextEditingController(
                            text:
                                daylimealList[index].choices[choiceIndex].text),
                      ),
                    );
                  }
                  initialized = true; // فقط همین یک بار!
                }

                return ReorderableListView.builder(
                  buildDefaultDragHandles: false,
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 70),
                  proxyDecorator: (child, __, _) => proxyDecorator(child),
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
                            child:
                                const Icon(Icons.delete, color: Colors.white),
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
                                      bottom: index ==
                                              controllers[mealIndex].length - 1
                                          ? 0
                                          : 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                    .copyWith(
                                                        color: Colors.white),
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
                                              top:
                                                  10, // مقدار تنظیم فاصله از بالا
                                              left: 7, // فاصله از راست
                                              child: InkWell(
                                                child: const Icon(Icons.paste,
                                                    size: 20,
                                                    color: Colors.white),
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
                                              child:
                                                  const Icon(Icons.drag_handle),
                                            )
                                          : SizedBox(
                                              height: 80,
                                              width: 25,
                                              child: OutlinedButton(
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.zero),
                                                  onPressed: () =>
                                                      removeTextField(
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
                );
              },
            )));
  }
}
