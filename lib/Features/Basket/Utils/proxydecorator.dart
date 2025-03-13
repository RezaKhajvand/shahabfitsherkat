import 'package:flutter/material.dart';

Widget proxyDecorator(Widget child) {
  return Material(
    elevation: 0,
    color: Colors.transparent,
    child: child,
  );
}
