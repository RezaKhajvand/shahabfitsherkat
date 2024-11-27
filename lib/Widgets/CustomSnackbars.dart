import 'package:flutter/material.dart';

getErrorSnackbar(BuildContext context, String errormsg) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 184, 0, 80),
      content: Text(errormsg)));
}
getSuccessSnackbar(BuildContext context, String successmsg) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromARGB(255, 0, 140, 89),
      content: Text(successmsg)));
}
