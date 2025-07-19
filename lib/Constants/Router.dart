import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Pages/ActivitiesPage.dart';
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart';
import 'package:shahabfit/Features/Basket/Utils/basketinput.dart';
import 'package:shahabfit/Features/Basket/Widgets/SystemPickerPage.dart';
import 'package:shahabfit/Features/Basket/Widgets/createtamrinpage.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/Trainer_Screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_list_screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_screen.dart';
import 'package:shahabfit/Features/Daylimeal/bloc/daylimeal_list_bloc.dart';
import 'package:shahabfit/Features/Home/Pages/HomePage.dart';
import 'package:shahabfit/Features/Splash/SplashPage.dart';
import 'package:shahabfit/Features/System/Pages/SystemPage.dart';
import 'package:shahabfit/Features/barnameview/page/barnamedetail_screen.dart';
import 'package:shahabfit/Features/barnameview/page/barnameview_screen.dart';
import 'package:shahabfit/Features/barnameview/page/daylimealview_screen.dart';
import 'package:shahabfit/Features/landing/view/blog_screen.dart';
import 'package:shahabfit/Features/landing/view/landing_screen.dart';
import 'package:shahabfit/Features/login/data/fingerprint.dart';
import 'package:shahabfit/Features/login/view/loginpage.dart';
import 'package:shahabfit/Features/oldversion/addpage.dart';
import 'package:shahabfit/Features/oldversion/editpage.dart';
import 'package:shahabfit/Features/oldversion/managepage.dart';
import 'package:shahabfit/Features/oldversion/searchpage.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart'; // بلاک
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart'; // بلاک‌ها هم به صورت عادی باقی می‌مانند
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart'; // مدل
import 'package:lottie/lottie.dart';

const String landingPage = '/';
const String loginPage = '/login';
const String blogPage = '/blog';
const String activitiesPage = '/activities';
const String basketListPage = '/basketlist';
const String systemPage = '/system';
const String managePage = '/manage';
const String splashPage = '/splash';
const String basketPage = '/basket';
const String systemPickerPage = '/systempicker';
const String dayliMealPage = '/daylimeal';
const String trainerPage = '/trainer';
const String shagerdSearchPage = '/shagerdsearch';
const String daylimealListPage = '/daylimeallist';
const String editShagerdPage = '/editshagerd';
const String createShagerdPage = '/createshagerd';
const String tamrinViewPage = '/tamrinview';
const String dayliViewPage = '/dayliview';
const String barnameDetailPage = '/barnamedetailview';
const String createTamrinPage = '/createtamrin';
const String profilePage = '/profile';
//
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/// GoRouter configuration with lazy loading applied.
final router = GoRouter(
  initialLocation:
      AuthManager.readAccessToken() != null ? splashPage : loginPage,
  redirect: (context, state) async {
    var path = state.uri.path;
    if (state.uri.path.contains(landingPage)) {
      return null;
    } else {
      if (AuthManager.readAccessToken() != null) {
        if (path == loginPage) {
          return splashPage;
        }
        return null;
      } else {
        if (state.uri.path.contains(tamrinViewPage) ||
            state.uri.path.contains(barnameDetailPage) ||
            state.uri.path.contains(dayliViewPage)) {
          return null;
        }
        return loginPage;
      }
    }
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        print(state.fullPath);
        int tabIndex = 0;
        switch (state.fullPath) {
          case managePage:
            tabIndex = 0;
            break;
          case basketListPage:
            tabIndex = 1;
            break;
          case daylimealListPage:
            tabIndex = 2;
            break;
          case profilePage:
            tabIndex = 3;
            break;
        }
        return MobileLayout(
            child: HomePage(
          tabIndex: tabIndex,
          child: child,
        ));
      },
      routes: <RouteBase>[
        GoRoute(
          path: managePage,
          builder: (BuildContext context, GoRouterState state) {
            return const ManagePage();
          },
        ),
        GoRoute(
          path: basketListPage,
          builder: (BuildContext context, GoRouterState state) {
            return const BasketListPage();
          },
        ),
        GoRoute(
          path: daylimealListPage,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => DaylimealListBloc(),
              child: const DayliMealListScreen(),
            );
          },
        ),
        GoRoute(
          path: profilePage,
          builder: (BuildContext context, GoRouterState state) {
            return ProfilePage();
          },
        ),
      ],
    ),

    GoRoute(
      path: createTamrinPage,
      builder: (context, state) {
        final basketId = state.uri.queryParameters['basketId'];
        return MobileLayout(
          child: CreateTamrinPage(basketId: basketId),
        );
      },
    ),

    // Landing Screen
    GoRoute(
      path: landingPage,
      builder: (context, state) =>
          LandingScreen(key: const ValueKey(landingPage)),
    ),
    // Blog Screen with parameter
    GoRoute(
      path: '$blogPage/:blogId',
      builder: (context, state) {
        final blogId = int.parse(state.pathParameters["blogId"]!);
        return BlogScreen(blogId: blogId, key: const ValueKey(blogPage));
      },
    ),
    // Login Screen
    GoRoute(
      path: loginPage,
      builder: (context, state) => MobileLayout(
        child: LoginPage(),
      ),
    ),
    // Splash Screen
    GoRoute(
      path: splashPage,
      builder: (context, state) => MobileLayout(
        child: SplashScreen(),
      ),
    ),

    // System Picker Screen
    GoRoute(
      path: systemPickerPage,
      builder: (context, state) {
        final recordId = state.uri.queryParameters['recordId'] ?? 'recordId';
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
        final tabIndex = state.uri.queryParameters['tabIndex'] ?? '0';

        return MobileLayout(
          child: SystemPickerPage(
            recordId: recordId,
            basketId: basketId,
            tabIndex: tabIndex,
          ),
        );
      },
    ),
    // Activities Screen
    GoRoute(
        path: activitiesPage,
        builder: (context, state) {
          final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
          final tabIndex = state.uri.queryParameters['tabIndex'] ?? '0';
          return MobileLayout(
            child: ActivitiesPage(
              basketId: basketId,
              tabIndex: tabIndex,
            ),
          );
        }),
    // Basket Screen
    GoRoute(
      path: basketPage,
      builder: (context, state) {
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
        final tabIndex =
            int.parse(state.uri.queryParameters['tabIndex'] ?? '0');
        return MobileLayout(
          child: BasketPage(
              basketInputs:
                  BasketInputs(basketId: basketId, tabIndex: tabIndex)),
        );
      },
    ),
    // System Screen
    GoRoute(
      path: systemPage,
      builder: (context, state) => MobileLayout(
        child: SystemPage(),
      ),
    ),
    GoRoute(
      path: dayliMealPage,
      builder: (context, state) {
        final barnameId = state.uri.queryParameters['barnameId']!;
        return MobileLayout(
          child: BlocProvider(
            create: (context) => DaylimealListBloc(),
            child: DaylimealScreen(barnameId: barnameId),
          ),
        );
      },
    ),
    // Trainer Screen
    GoRoute(
      path: trainerPage,
      builder: (context, state) {
        final barnameId = state.uri.queryParameters['barnameId'];
        return MobileLayout(
          child: BlocProvider(
            create: (context) => DaylimealListBloc(),
            child: TrainerScreen(barnameId: barnameId),
          ),
        );
      },
    ),

    // Edit Shagerd Screen
    GoRoute(
      path: editShagerdPage,
      builder: (context, state) {
        final shagerd = state.extra as Shagerd;
        return MobileLayout(
          child: EditPage(shagerd: shagerd),
        );
      },
    ),
    // Create Shagerd Screen
    GoRoute(
      path: createShagerdPage,
      builder: (context, state) => MobileLayout(
        child: BlocProvider(
          create: (context) => ShagerdBloc(),
          child: AddPage(),
        ),
      ),
    ),
    // Shagerd Search Screen with BlocProvider
    GoRoute(
      path: shagerdSearchPage,
      builder: (context, state) => BlocProvider(
        create: (context) => ShagerdBloc(),
        child: MobileLayout(child: SearchPage()),
      ),
    ),
    // Barname View Screen with MultiBlocProvider
    GoRoute(
      path: tamrinViewPage,
      builder: (context, state) {
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
        final tabIndex = state.uri.queryParameters['tabIndex'] ?? '0';
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => BarnameViewBloc())],
          child: MobileLayout(
              child: BarnameViewPage(basketId: basketId, tabIndex: tabIndex)),
        );
      },
    ),

    GoRoute(
      path: dayliViewPage,
      builder: (context, state) {
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';

        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => BarnameViewBloc())],
          child: MobileLayout(child: DaylimealViewPage(basketId: basketId)),
        );
      },
    ),

    // Barname Detail Screen with MultiBlocProvider
    GoRoute(
      path: barnameDetailPage,
      builder: (context, state) {
        final recordId = state.uri.queryParameters['recordId'] ?? 'recordId';
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';

        return BlocProvider(
          create: (context) => BarnameViewBloc(),
          child: MobileLayout(
              child: BarnameDetailPage(recordId: recordId, basketId: basketId)),
        );
      },
    ),
  ],
);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => registerFingerprint(),
              icon: Icon(Icons.fingerprint)),
          IconButton(
              onPressed: () => logOut(), icon: Icon(Icons.logout_rounded)),
        ],
      ),
      backgroundColor: background,
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => selected = !selected),
          child: AnimatedScale(
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
            scale: selected ? 1 : 0.9,
            child: Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: selected
                    ? [
                        const BoxShadow(
                          color: Colors.black,
                          blurRadius: 60,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        ),
                      ]
                    : null,
              ),
              child: Stack(
                children: [
                  Image.asset('images/imageball.png',
                      fit: BoxFit.fill, filterQuality: FilterQuality.low),
                  AnimatedOpacity(
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 500),
                    opacity: selected ? 1 : 0,
                    child: Lottie.asset(
                      'images/data.zip',
                      filterQuality: FilterQuality.low,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
