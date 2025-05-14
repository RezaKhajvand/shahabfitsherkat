import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Data/addDescriptionDataSource.dart';
import 'package:shahabfit/Features/Basket/Data/getDescriptionListDataSource.dart.dart';
import 'package:shahabfit/Features/Basket/Data/insertBasketDataSource.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/constants/Router.dart';

class AutoCompleteWithScroll extends StatefulWidget {
  const AutoCompleteWithScroll({super.key});
  @override
  State<AutoCompleteWithScroll> createState() => _AutoCompleteWithScrollState();
}

class _AutoCompleteWithScrollState extends State<AutoCompleteWithScroll> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  List<DescriptionModel> descriptionList = [];
  int chipIndex = 0;
  Future<List<DescriptionModel>> fetchDescriptions({String? text}) async {
    return descriptionFromJson(await getDescriptionList(DescriptionType.tamrin))
        .where((element) => element.text.contains(text ?? ''))
        .toList();
  }

  List<DescriptionModel> filteredSuggestions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          'انتخاب نام برنامه',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
                controller: nameController,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.white),
                decoration: const InputDecoration(
                    hintText: 'نام برنامه',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10))),
            const SizedBox(height: 16),
            Row(
              children: [
                ChoiceChip(
                    label: const Text('مبتدی'),
                    onSelected: (value) => setState(() => chipIndex = 0),
                    selected: chipIndex == 0),
                const SizedBox(width: 14),
                ChoiceChip(
                    label: const Text('حرفه ای'),
                    onSelected: (value) => setState(() => chipIndex = 1),
                    selected: chipIndex == 1),
              ],
            ),
            const SizedBox(height: 20),
            TypeAheadField<DescriptionModel>(
                controller: descController,
                hideOnEmpty: true,
                suggestionsCallback: (search) async {
                  if (descriptionList.isEmpty) {
                    return descriptionList = descriptionFromJson(
                        await getDescriptionList(DescriptionType.tamrin));
                  } else {
                    return descriptionList
                        .where((element) => element.text.contains(search))
                        .toList();
                  }
                },
                builder: (context, controller, focusNode) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    autofocus: true,
                    maxLines: 3,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(fontSize: 14, color: Colors.white),
                    decoration: const InputDecoration(
                        alignLabelWithHint: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        label: Text('توضیحات برنامه'),
                        labelStyle: TextStyle(fontSize: 14)),
                  );
                },
                itemSeparatorBuilder: (context, index) =>
                    const Divider(height: 2),
                itemBuilder: (context, description) =>
                    ListTile(dense: true, title: Text(description.text)),
                onSelected: (value) => descController.text = value.text),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (!descriptionList.any(
                        (element) => element.text == descController.text)) {
                      addDescription(
                          descController.text, DescriptionType.tamrin);
                    }

                    try {
                      final reasult = await insertBasket(
                          name: nameController.text,
                          level: chipIndex == 0 ? 'مبتدی' : 'حرفه ای',
                          description: descController.text);

                      context.pushReplacement(
                          '$activitiesPage?basketId=${reasult.id}');
                    } catch (e, s) {
                      getErrorSnackbar(context, handleException(e, s));
                    }
                  },
                  child: const Text('ذخیره برنامه')),
            )
          ],
        ),
      ),
    );
  }
}
