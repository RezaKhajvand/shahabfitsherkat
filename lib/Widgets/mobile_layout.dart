import 'package:flutter/material.dart';

const double mobileWidth = 400;
const double tabletWidth = 400;

class MobileLayout extends StatelessWidget {
  final Widget child;
  const MobileLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > tabletWidth) {
        return Center(child: SizedBox(width: mobileWidth, child: child));
      }
      return child;
    });
  }
}
