import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';

Future<dynamic> customModalSheet(BuildContext context, Widget child) {
  final maxWidth = MediaQuery.of(context).size.width;
  return showModalBottomSheet(
      backgroundColor: background,
      elevation: 0,
      constraints: BoxConstraints(
          maxWidth: maxWidth > tabletWidth ? mobileWidth : maxWidth),
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (context) => child);
}
