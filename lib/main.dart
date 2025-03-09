import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/login/bloc/login_bloc.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shahabfit/constants/theme.dart';
import 'package:shahabfit/Features/Activities/Bloc/ActivityBloc/activity_bloc.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/Daylimeal/bloc/daylimeal_list_bloc.dart';
import 'package:shahabfit/Features/System/Bloc/System/system_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/updateshagerd/update_shagerd_bloc.dart';
import 'package:shahabfit/Utils/scrollbehavior.dart';

final globalKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ActivityBloc()),
        BlocProvider(create: (context) => BasketBloc()),
        BlocProvider(create: (context) => SystemBloc()),
        BlocProvider(create: (context) => DaylimealListBloc()),
        BlocProvider(create: (context) => ShagerdBloc()),
        BlocProvider(create: (context) => UpdateShagerdBloc()),
        BlocProvider(create: (context) => LoginBloc()),
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
      locale: const Locale("fa", "IR"), //
    );
  }
}
