import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/ColorExtension.dart';

class SystemPicker extends StatefulWidget {
  final int tabIndex;
  final ActivityItem basketActivity;
  const SystemPicker(
      {super.key, required this.basketActivity, required this.tabIndex});

  @override
  State<SystemPicker> createState() => _SystemPickerState();
}

class _SystemPickerState extends State<SystemPicker> {
  @override
  Widget build(BuildContext context) {
    Color colorHex =
        HexColor.fromHex(colorList[widget.basketActivity.systemSubId]);
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: colorHex),
                foregroundColor: colorHex,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            onPressed: () => Router.neglect(
              context,
              () => context.go(
                '$systemPickerPage?recordId=${widget.basketActivity.id}&basketId=${widget.basketActivity.basket}&tabIndex=${widget.tabIndex}',
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(widget.basketActivity.expand.system?.title ??
                        'بدون سیستم'),
                    widget.basketActivity.systemSubId != 0
                        ? Text(replaceFarsiNumber(
                            '- کانال : ${(widget.basketActivity.systemSubId)}'))
                        : SizedBox()
                  ],
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<BasketBloc>(context).add(
                          UpdateBasketActivityEvent(
                              basketActivityId: widget.basketActivity.id,
                              system: null,
                              systemSubId: 0));
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 24,
                      color: Colors.white60,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
