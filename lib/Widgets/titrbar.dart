import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/landing/utils/fontsize.dart';
import 'package:shahabfit/utils/texttheme.dart';

class TitrBar extends StatelessWidget {
  const TitrBar({
    super.key,
    required this.screenWidth,
    required this.title,
  });
  final String title;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'images/dumble.png',
          width: 45,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(width: 14),
        Text(
          title,
          style: context.anjomanBlack
              .copyWith(color: textColor, fontSize: getFontSize(screenWidth)),
        ),
      ],
    );
  }
}
