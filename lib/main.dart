import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/Basket/Bloc/basketlist/basket_list_bloc.dart';
import 'package:shahabfit/Features/login/bloc/login_bloc.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shahabfit/constants/theme.dart';
import 'package:shahabfit/Features/Activities/Bloc/ActivityBloc/activity_bloc.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/System/Bloc/System/system_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/updateshagerd/update_shagerd_bloc.dart';
import 'package:shahabfit/Utils/scrollbehavior.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // فقط حالت عمودی رو به بالا
  ]);

  await getItInit();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await initFirebase();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityBloc()),
        BlocProvider(create: (context) => BasketBloc()),
        BlocProvider(create: (context) => SystemBloc()),
        BlocProvider(create: (context) => ShagerdBloc()),
        BlocProvider(create: (context) => UpdateShagerdBloc()),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => BasketListBloc()),
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
      scrollBehavior: MyCustomScrollBehavior(),
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale("fa", "IR")],
      locale: const Locale("fa", "IR"),
    );
  }
}

initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);
  final fcmToken = await FirebaseMessaging.instance.getToken(
      vapidKey:
          "BJQUpS7dh779bMiGKbdRn7imKkfLH8dHlzTXkk-T39Qev1PXwft3KBtr2V41fM-uDFYXmRt5mSMyocedGH-MQdw");
  print(fcmToken);
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    print(fcmToken);
  }).onError((err) {
    print(err);
  });
}
