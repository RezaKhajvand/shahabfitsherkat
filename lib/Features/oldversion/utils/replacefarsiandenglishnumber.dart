import 'package:flutter/services.dart';

String replaceEnglishNumber(String input) {
  var english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var i = 0; i < farsi.length; i++) {
    input = input.replaceAll(farsi[i], english[i]);
  }
  return input;
}

String replaceFarsiNumber(String input) {
  var english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }
  return input;
}

class FarsiInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    newValue = newValue.copyWith(text: replaceFarsiNumber(newValue.text));
    oldValue = newValue.copyWith(text: replaceFarsiNumber(newValue.text));
    return oldValue;
  }
}
