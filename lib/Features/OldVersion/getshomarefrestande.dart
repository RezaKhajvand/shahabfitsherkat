import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';



TextFormField getCliclableTextfield(
  String validatorText,
  TextEditingController controller,
  String hinttext,
  void Function() onTap,
  bool isNumber,
) {
  return TextFormField(
      controller: controller,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.right,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return validatorText;
          }
        } else {
          return validatorText;
        }
        return null;
      },
      enableInteractiveSelection: false,
      enableSuggestions: false,
      focusNode: AlwaysDisabledFocusNode(),
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: isNumber ? 16 : 14,
          color: Colors.white,
          letterSpacing: isNumber ? 2 : 0),
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.arrow_back_ios_new,
          size: 15,
          color: Colors.white,
        ),
        hintText: replaceFarsiNumber(hinttext),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white,
            letterSpacing: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: cardBorderRadius,
            borderSide: const BorderSide(
                width: 1.5, color:Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: cardBorderRadius,
            borderSide: const BorderSide(
                width: 1.5, color:Colors.white)),
      ),
      onTap: onTap);
}

getBottomSheet(Widget childclass, BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    isScrollControlled: true,

    backgroundColor: background,
    builder: (context) {
      return childclass;
    },
  );
}
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}