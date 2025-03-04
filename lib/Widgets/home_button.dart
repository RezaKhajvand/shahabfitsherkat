import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/constants/router.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async => context.go(mainPage),
        icon: const Icon(Icons.home_rounded));
  }
}
