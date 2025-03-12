import 'package:flutter/material.dart';
import 'package:shahabfit/Features/Basket/Data/getDescriptionListDataSource.dart.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Utils/texttheme.dart';

Future<List<DescriptionModel>> fetchDescriptions() async {
  return descriptionFromJson(await getDescriptionList(DescriptionType.tamrin));
}

class AutocompleteExample extends StatefulWidget {
  const AutocompleteExample({super.key});

  @override
  AutocompleteExampleState createState() => AutocompleteExampleState();
}

class AutocompleteExampleState extends State<AutocompleteExample> {
  List<DescriptionModel> descriptionList = [];

  @override
  void initState() {
    super.initState();
    fetchDescriptions().then((list) {
      setState(() {
        descriptionList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<DescriptionModel>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<DescriptionModel>.empty();
        }
        return descriptionList.where((element) => element.text
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      displayStringForOption: (DescriptionModel option) => option.text,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          maxLines: 3,
          style: context.anjomanLight,
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            labelText: 'توضیحات برنامه',
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            child: SizedBox(
              width: 300,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: options.length,
                separatorBuilder: (context, index) => const Divider(height: 2),
                itemBuilder: (context, index) {
                  final option = options.elementAt(index);
                  return ListTile(
                    dense: true,
                    title: Text(option.text),
                    onTap: () => onSelected(option),
                  );
                },
              ),
            ),
          ),
        );
      },
      onSelected: (DescriptionModel value) {
        // در صورت نیاز می‌توانید اقدامی انجام دهید
        debugPrint("انتخاب شد: ${value.text}");
      },
    );
  }
}
