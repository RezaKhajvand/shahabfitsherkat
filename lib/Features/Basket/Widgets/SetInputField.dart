import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';

class SetInputField extends StatefulWidget {
  final ActivityItem basketActivity;
  final int fieldIndex;
  final int setIndex;
  const SetInputField({
    super.key,
    required this.fieldIndex,
    required this.basketActivity,
    required this.setIndex,
  });

  @override
  State<SetInputField> createState() => _SetInputFieldState();
}

class _SetInputFieldState extends State<SetInputField> {
  final TextEditingController _fieldController = TextEditingController();
  late FixedExtentScrollController _controller;
  bool isWheeling = true;
  var focusNode = FocusNode();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = FixedExtentScrollController(
        initialItem: widget.basketActivity.activitySet[widget.setIndex]
            [widget.fieldIndex]);
  }

  scrollToItem(int itemIndex) {
    _controller.jumpToItem(itemIndex);
  }

  updateBasketActivity(int value) {
    _timer?.cancel();
    _timer = null;
    _timer = Timer(const Duration(seconds: 1), () {
      widget.basketActivity.activitySet[widget.setIndex][widget.fieldIndex] =
          value;
      BlocProvider.of<BasketBloc>(context).add(UpdateBasketActivityEvent(
          basketActivityId: widget.basketActivity.id,
          activitySet: widget.basketActivity.activitySet));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isWheeling = false);
        focusNode.requestFocus();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: cardBorderRadius),
        alignment: Alignment.center,
        child: IndexedStack(
          alignment: Alignment.center,
          index: isWheeling ? 1 : 0,
          children: [
            TextFormField(
              controller: _fieldController,
              focusNode: focusNode,
              decoration: const InputDecoration(
                  counter: SizedBox(),
                  error: SizedBox(),
                  border: InputBorder.none),
              keyboardType: TextInputType.number,
              enableInteractiveSelection: false,
              textInputAction: TextInputAction.done,
              maxLength: 2,
              onTapOutside: (event) {
                focusNode.unfocus();
                setState(() => isWheeling = true);
                scrollToItem(
                    int.parse(replaceEnglishNumber(_fieldController.text)));
                updateBasketActivity(
                    int.parse(replaceEnglishNumber(_fieldController.text)));
              },
              onFieldSubmitted: (_) {
                setState(() => isWheeling = true);
                scrollToItem(
                    int.parse(replaceEnglishNumber(_fieldController.text)));
                updateBasketActivity(
                    int.parse(replaceEnglishNumber(_fieldController.text)));
              },
              textAlign: TextAlign.center,
              inputFormatters: [FarsiInputFormatter()],
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: Colors.white),
            ),
            ListWheelScrollView(
                controller: _controller,
                physics: const FixedExtentScrollPhysics(),
                itemExtent: 25,
                squeeze: 0.85,
                diameterRatio: 1,
                onSelectedItemChanged: (value) => updateBasketActivity(value),
                children: List.generate(
                    100,
                    (index) => Text(replaceFarsiNumber((index + 1).toString()),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}
