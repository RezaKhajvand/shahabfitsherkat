import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/Theme.dart';
import 'package:shahabfit/Features/Activities/Bloc/ActivityBloc/activity_bloc.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/System/Bloc/System/system_bloc.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/jalasat/jalasat.dart';
import 'package:shahabfit/Features/OldVersion/hivemodel/shagerd/shagerd.dart';
import 'package:shahabfit/Features/OldVersion/ManagePage.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

// Create an instance of the ShorebirdCodePush class
final shorebirdCodePush = ShorebirdCodePush();
final globalKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HiveShagerdAdapter());
  Hive.registerAdapter(HiveJalaseAdapter());
//
  await Hive.openBox<HiveShagerd>('shagerdbox');
  await Hive.openBox<HiveJalase>('jalasatbox');
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: 'AIzaSyANwN-AAUGT1_WjZhgV-ZG-3T4NO23ETPg');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ActivityBloc(),
        ),
        BlocProvider(
          create: (context) => BasketBloc(),
        ),
        BlocProvider(
          create: (context) => SystemBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void initState() {
  //   super.initState();
  //   _checkForUpdates();
  // }
  // Future<void> _checkForUpdates() async {
  //   // Check whether a patch is available to install.
  //   final isUpdateAvailable =
  //       await shorebirdCodePush.isNewPatchAvailableForDownload();
  //   var nextVersion = await shorebirdCodePush.nextPatchNumber();
  //   if (isUpdateAvailable) {
  //     globalKey.currentState?.showSnackBar(SnackBar(
  //         padding: const EdgeInsets.all(16),
  //         duration: const Duration(seconds: 10),
  //         dismissDirection: DismissDirection.none,
  //         content: ProgressContent(nextVersion: nextVersion)));
  //     // Download the new patch if it's available.
  //   }
  // }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('images/splash.jpg'), context);
    precacheImage(const AssetImage('images/shahabbg.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: getTheme(isFirstTheme: true),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale("fa", "IR")],
      locale: const Locale("fa", "IR"), //
    );
  }
}

class ProgressContent extends StatefulWidget {
  const ProgressContent({
    super.key,
    required this.nextVersion,
  });

  final int? nextVersion;

  @override
  State<ProgressContent> createState() => _ProgressContentState();
}

class _ProgressContentState extends State<ProgressContent>
    with SingleTickerProviderStateMixin {
  bool isDownloading = false;
  String updateText = '';
  double? progressValue;
  //
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    controller.addListener(() {
      setState(() {});
    });
    updateText =
        replaceFarsiNumber('آیا مایل به آپدیت اپلیکیشن به ورژن جدید هستید؟');
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(updateText, style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: controller.isAnimating || controller.isCompleted
                      ? controller.value
                      : null,
                )
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              TextButton(
                child: Text(controller.isCompleted ? 'بستن' : 'بله'),
                onPressed: () async {
                  try {
                    if (controller.isCompleted) {
                      SystemNavigator.pop();
                    } else if (!controller.isAnimating) {
                      setState(() => updateText = 'در حال بروزرسانی ...');
                      controller.reset();
                      controller.forward();
                      await shorebirdCodePush.downloadUpdateIfAvailable();
                      controller.animateTo(1,
                          duration: const Duration(milliseconds: 300));
                      setState(
                          () => updateText = 'بروزرسانی با موفقیت انجام شد');
                    }
                  } catch (e) {
                    controller.reset();
                    setState(() => updateText = 'بروزرسانی با مشکل مواجه شد');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        image: DecorationImage(
          image: AssetImage('images/shahabbg.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: const MyHomePage(),
    );
  }
}
