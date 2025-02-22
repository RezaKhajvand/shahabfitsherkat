import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errormsg;
  final void Function() onPressed;
  const CustomErrorWidget(
      {super.key, required this.errormsg, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          errormsg,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () => onPressed(), child: const Text('تلاش مجدد')),
      ],
    );
  }
}
