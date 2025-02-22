import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/landing/utils/opensocial.dart';
import 'package:shahabfit/utils/texttheme.dart';

class SocialCard extends StatelessWidget {
  final String url;
  final String imagePath;
  final String title;
  const SocialCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => openSocialMedia(context, url),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 8, 10, 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: context.anjomanLight.copyWith(color: background),
            )
          ],
        ),
      ),
    );
  }
}
