import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Utils/apptab.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToMainPage();
  }

  goToMainPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));

    // 🚨 اینو از API واقعی بگیر
    List<String> userAccess = AuthManager.readAccess();

    // لیست همه تب‌ها (مثل قبل)
    final allowedTabs =
        allTabs.where((t) => userAccess.contains(t.id)).toList();

    // اولین تب مجاز رو انتخاب کن
    final startRoute =
        allowedTabs.isNotEmpty ? allowedTabs.first.route : profilePage;

    // حالا برو به اون تب
    if (mounted) {
      context.go(startRoute); // 👈 اینجا go بزن، نه pushReplacement
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width / 1.1;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/splash.png',
              width: imageWidth,
              fit: BoxFit.fitWidth,
            ),
            Shimmer.fromColors(
              baseColor: Colors.transparent,
              period: const Duration(seconds: 2),
              highlightColor: Colors.white,
              child: Image.asset(
                'images/splash.png',
                width: imageWidth,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
