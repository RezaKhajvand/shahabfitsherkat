import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/Basket/Widgets/SetInputField.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';

class SetRowItem extends StatefulWidget {
  final ActivityItem basketActivity;
  final int setIndex;

  const SetRowItem({
    super.key,
    required this.setIndex,
    required this.basketActivity,
  });

  @override
  State<SetRowItem> createState() => _SetRowItemState();
}

class _SetRowItemState extends State<SetRowItem> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      key: Key(widget.basketActivity.activitySet[widget.setIndex].hashCode
          .toString()),
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: SetInputField(
              basketActivity: widget.basketActivity,
              setIndex: widget.setIndex,
              fieldIndex: 0,
            ),
          ),
          Text(
            '    X    ',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
          Expanded(
            child: SetInputField(
              basketActivity: widget.basketActivity,
              setIndex: widget.setIndex,
              fieldIndex: 1,
            ),
          ),
          const SizedBox(width: 100),
          IconButton(
              onPressed: () async {
                if (widget.basketActivity.activitySet.length >= 2) {
                  BlocProvider.of<BasketBloc>(context).add(
                      UpdateBasketActivityEvent(
                          basketActivityId: widget.basketActivity.id,
                          activitySet: widget.basketActivity.activitySet
                            ..removeAt(widget.setIndex)));
                } else {
                  getErrorSnackbar(context, 'حداقل یک ست لازم است');
                }
              },
              icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}