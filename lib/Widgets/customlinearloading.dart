import 'package:flutter/material.dart';
import 'package:shahabfit/constants/colors.dart';

class CustomLinearLoading extends StatelessWidget {
  const CustomLinearLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: primary.withValues(alpha: 0.2),
      color: primary,
    );
  }
}
