import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openSocialMedia(BuildContext context, uri) async {
  try {
    await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
  } catch (ex) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          ex.toString(),
          style: context.anjomanRegular.copyWith(color: background),
        )));
  }
}
