import 'package:flutter/material.dart';

getErrorSnackbar(
    BuildContext context, String errormsg, {SnackBarAction? action}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 184, 0, 80),
      content: Text(errormsg),
      action: action));
}

getSuccessSnackbar(BuildContext context, String successmsg) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 0, 140, 89),
      content: Text(successmsg)));
}
