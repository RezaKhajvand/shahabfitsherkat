import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Bloc/basketlist/basket_list_bloc.dart';
import 'package:shahabfit/Features/Basket/Data/addDescriptionDataSource.dart';
import 'package:shahabfit/Features/Basket/Data/getDescriptionListDataSource.dart';
import 'package:shahabfit/Features/Basket/Data/insertBasketDataSource.dart';
import 'package:shahabfit/Features/Basket/Data/updateBasketDataSource.dart';
import 'package:shahabfit/Features/Basket/Models/description_model.dart';
import 'package:shahabfit/Features/Basket/Utils/descriptiontype.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/constants/Router.dart';

class CreateTamrinPage extends StatefulWidget {
  final String? basketId;
  const CreateTamrinPage({super.key, required this.basketId});
  @override
  State<CreateTamrinPage> createState() => _CreateTamrinPageState();
}

class _CreateTamrinPageState extends State<CreateTamrinPage> {
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
  void initState() {
    super.initState();
    if (widget.basketId != null) {
      BlocProvider.of<BasketListBloc>(context)
          .add(GetBasketList(basketId: widget.basketId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text(
          widget.basketId == null ? 'ساخت برنامه' : 'ویرایش برنامه',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<BasketListBloc, BasketListState>(
          listener: (context, state) {
            if (state is BasketListError) {
              getErrorSnackbar(context, state.errormsg);
            }
          },
          builder: (context, state) {
            if (state is BasketListLoaded) {
              final basket = state.basketList.first;
              nameController.text = basket.name;
              descController.text = basket.description;
              switch (basket.level) {
                case 'مبتدی':
                  chipIndex = 0;
                  break;
                default:
                  chipIndex = 1;
              }
            }
            return Column(
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
                StatefulBuilder(builder: (context, setState) {
                  return Row(
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
                  );
                }),
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
                        style:
                            const TextStyle(fontSize: 14, color: Colors.white),
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
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
                          if (widget.basketId == null) {
                            final reasult = await insertBasket(
                                name: nameController.text,
                                level: chipIndex == 0 ? 'مبتدی' : 'حرفه ای',
                                description: descController.text);
                            Router.neglect(
                                context,
                                () => context.go(
                                    '$activitiesPage?basketId=${reasult.id}'));
                          } else {
                            await updateBasket(
                                basketId: widget.basketId!,
                                name: nameController.text,
                                level: chipIndex == 0 ? 'مبتدی' : 'حرفه ای',
                                description: descController.text);
                            Router.neglect(
                                context,
                                () => context.go(
                                    '$activitiesPage?basketId=${widget.basketId}'));
                          }
                        } catch (e, s) {
                          getErrorSnackbar(context, handleException(e, s));
                        }
                      },
                      child: Text(widget.basketId == null
                          ? 'ذخیره برنامه'
                          : 'ویرایش برنامه')),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
