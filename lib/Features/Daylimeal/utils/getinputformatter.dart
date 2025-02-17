import 'package:flutter/services.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';

List<TextInputFormatter> get getInputFormatter {
  return [
    FarsiInputFormatter(),
    FilteringTextInputFormatter.allow(RegExp(r'[0-9۰-۹]')),
  ];
}
