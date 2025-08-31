import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Utils/apptab.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';
import 'package:shahabfit/constants/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        print('lottie ended');
        goToMainPage(); // بعد از اتمام انیمیشن برو به صفحه بعدی
      }
    });
  }

  Future<void> goToMainPage() async {
    List<String> userAccess = AuthManager.readAccess();
    final allowedTabs =
        allTabs.where((t) => userAccess.contains(t.id)).toList();
    final startRoute =
        allowedTabs.isNotEmpty ? allowedTabs.first.route : profilePage;

    if (mounted) {
      context.go(startRoute);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: logomotionbg,
      body: ClipRect(
        child: Lottie.asset(
          'images/logomotion.zip',
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward(); // پلی شدن انیمیشن
          },
          fit: BoxFit.contain,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
