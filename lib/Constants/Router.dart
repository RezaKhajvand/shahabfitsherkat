import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Utils/basketinput.dart';
import 'package:shahabfit/Features/Basket/Widgets/descriptioninput.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_list_screen.dart';
import 'package:shahabfit/Features/Home/Pages/HomePage.dart';
import 'package:shahabfit/Features/login/data/fingerprint.dart';
import 'package:shahabfit/Features/oldversion/managepage.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart'; // بلاک
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart'; // بلاک‌ها هم به صورت عادی باقی می‌مانند
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart'; // مدل‌ها نیازی به lazy loading ندارند
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart'; // مدل

// Deferred imports for lazy loading
import 'package:shahabfit/Features/Activities/Pages/ActivitiesPage.dart'
    deferred as activities;
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart'
    deferred as basket;
import 'package:shahabfit/Features/Basket/Widgets/SystemPickerPage.dart'
    deferred as systempicker;
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_screen.dart'
    deferred as daylimeal;
import 'package:shahabfit/Features/Daylimeal/Pages/trainer_screen.dart'
    deferred as trainer;
import 'package:shahabfit/Features/Splash/SplashPage.dart' deferred as splash;
import 'package:shahabfit/Features/System/Pages/SystemPage.dart'
    deferred as system;
import 'package:shahabfit/Features/barnameview/page/barnamedetail_screen.dart'
    deferred as barnamedetail;
import 'package:shahabfit/Features/barnameview/page/barnameview_screen.dart'
    deferred as barnameview;
import 'package:shahabfit/Features/landing/view/blog_screen.dart'
    deferred as blog;
import 'package:shahabfit/Features/landing/view/landing_screen.dart'
    deferred as landing;
import 'package:shahabfit/Features/login/view/loginpage.dart' deferred as login;
import 'package:shahabfit/Features/oldversion/addpage.dart' deferred as addpage;
import 'package:shahabfit/Features/oldversion/editpage.dart'
    deferred as editpage;
import 'package:shahabfit/Features/oldversion/searchpage.dart'
    deferred as searchpage;

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
const String barnameViewPage = '/barnameview';
const String barnameDetailPage = '/barnamedetailview';
const String createTamrinPage = '/createtamrin';
const String profilePage = '/profile';
//
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/// Helper widget for deferred loading using FutureBuilder.
Widget deferredPageLoader(
    Future<void> Function() loadLibrary, Widget Function() builder) {
  return FutureBuilder(
    future: loadLibrary(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return builder();
      }
      return Scaffold(
        body: const Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('لطفا منتظر بمانید'),
            CircularProgressIndicator(),
          ],
        )),
      );
    },
  );
}

/// GoRouter configuration with lazy loading applied.
final router = GoRouter(
  initialLocation:
      AuthManager.readAccessToken() != null ? splashPage : loginPage,
  redirect: (context, state) async {
    var path = state.uri.path;
    if (AuthManager.readAccessToken() != null) {
      if (path == loginPage) {
        return splashPage;
      }
      return null;
    } else {
      if (state.uri.path.contains(barnameViewPage) ||
          state.uri.path.contains(barnameDetailPage)) {
        return null;
      }
      return loginPage;
    }
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MobileLayout(child: HomePage(child: child));
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
            return const DayliMealListScreen();
          },
        ),
        GoRoute(
          path: profilePage,
          builder: (BuildContext context, GoRouterState state) {
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                        onPressed: () => registerFingerprint(),
                        icon: Icon(Icons.fingerprint)),
                    IconButton(
                        onPressed: () => logOut(),
                        icon: Icon(Icons.logout_rounded)),
                  ],
                ),
                backgroundColor: background,
                body: const Center(child: Text('کاربری')));
          },
        ),
      ],
    ),

    GoRoute(
      path: createTamrinPage,
      builder: (context, state) => MobileLayout(
        child: AutoCompleteWithScroll(),
      ),
    ),

    // Landing Screen
    GoRoute(
      path: landingPage,
      builder: (context, state) => deferredPageLoader(landing.loadLibrary,
          () => landing.LandingScreen(key: const ValueKey(landingPage))),
    ),
    // Blog Screen with parameter
    GoRoute(
      path: '$blogPage/:blogId',
      builder: (context, state) {
        final blogId = int.parse(state.pathParameters["blogId"]!);
        return deferredPageLoader(
            blog.loadLibrary,
            () =>
                blog.BlogScreen(blogId: blogId, key: const ValueKey(blogPage)));
      },
    ),
    // Login Screen
    GoRoute(
      path: loginPage,
      builder: (context, state) => MobileLayout(
        child: deferredPageLoader(login.loadLibrary, () => login.LoginPage()),
      ),
    ),
    // Splash Screen
    GoRoute(
      path: splashPage,
      builder: (context, state) => MobileLayout(
        child:
            deferredPageLoader(splash.loadLibrary, () => splash.SplashScreen()),
      ),
    ),

    // System Picker Screen
    GoRoute(
      path: systemPickerPage,
      builder: (context, state) {
        final recordId = state.uri.queryParameters['recordId'] ?? 'recordId';
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
        return MobileLayout(
          child: deferredPageLoader(
              systempicker.loadLibrary,
              () => systempicker.SystemPickerPage(
                    recordId: recordId,
                    basketId: basketId,
                  )),
        );
      },
    ),
    // Activities Screen
    GoRoute(
        path: activitiesPage,
        builder: (context, state) {
          final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
          return MobileLayout(
            child: deferredPageLoader(activities.loadLibrary,
                () => activities.ActivitiesPage(basketId: basketId)),
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
          child: deferredPageLoader(
              basket.loadLibrary,
              () => basket.BasketPage(
                  basketInputs:
                      BasketInputs(basketId: basketId, tabIndex: tabIndex))),
        );
      },
    ),
    // System Screen
    GoRoute(
      path: systemPage,
      builder: (context, state) => MobileLayout(
        child:
            deferredPageLoader(system.loadLibrary, () => system.SystemPage()),
      ),
    ),

    // Home Screen
    // GoRoute(
    //   path: mainPage,
    //   builder: (context, state) {
    //     final tabIndex = state.uri.queryParameters['tabIndex'] ?? '0';
    //     return MobileLayout(
    //       child: deferredPageLoader(
    //           home.loadLibrary, () => home.HomePage(tabIndex: tabIndex)),
    //     );
    //   },
    // ),
    // Daylimeal Screen (با Trainer به عنوان extra)
    GoRoute(
      path: dayliMealPage,
      builder: (context, state) {
        final trainerData = state.extra as Trainer;
        return MobileLayout(
          child: deferredPageLoader(daylimeal.loadLibrary,
              () => daylimeal.DaylimealScreen(trainer: trainerData)),
        );
      },
    ),
    // Trainer Screen
    GoRoute(
      path: trainerPage,
      builder: (context, state) {
        final trainerData = state.extra as Trainer?;
        return MobileLayout(
          child: deferredPageLoader(trainer.loadLibrary,
              () => trainer.TrainerScreen(trainer: trainerData)),
        );
      },
    ),

    // Edit Shagerd Screen
    GoRoute(
      path: editShagerdPage,
      builder: (context, state) {
        final shagerd = state.extra as Shagerd;
        return MobileLayout(
          child: deferredPageLoader(
              editpage.loadLibrary, () => editpage.EditPage(shagerd: shagerd)),
        );
      },
    ),
    // Create Shagerd Screen
    GoRoute(
      path: createShagerdPage,
      builder: (context, state) => MobileLayout(
        child: deferredPageLoader(
            addpage.loadLibrary,
            () => BlocProvider(
                  create: (context) => ShagerdBloc(),
                  child: addpage.AddPage(),
                )),
      ),
    ),
    // Shagerd Search Screen with BlocProvider
    GoRoute(
      path: shagerdSearchPage,
      builder: (context, state) => deferredPageLoader(
        searchpage.loadLibrary,
        () => BlocProvider(
          create: (context) => ShagerdBloc(),
          child: MobileLayout(child: searchpage.SearchPage()),
        ),
      ),
    ),
    // Barname View Screen with MultiBlocProvider
    GoRoute(
      path: barnameViewPage,
      builder: (context, state) {
        final basketId = state.uri.queryParameters['basketId'] ?? 'basketId';
        final tabIndex = state.uri.queryParameters['tabIndex'] ?? '0';
        return deferredPageLoader(
          barnameview.loadLibrary,
          () => MultiBlocProvider(
            providers: [BlocProvider(create: (context) => BarnameViewBloc())],
            child: MobileLayout(
                child: barnameview.BarnameViewPage(
                    basketId: basketId, tabIndex: tabIndex)),
          ),
        );
      },
    ),
    // Barname Detail Screen with MultiBlocProvider
    GoRoute(
      path: barnameDetailPage,
      builder: (context, state) {
        final recordId = state.uri.queryParameters['recordId'] ?? 'recordId';
        return deferredPageLoader(
          barnamedetail.loadLibrary,
          () => BlocProvider(
            create: (context) => BarnameViewBloc(),
            child: MobileLayout(
                child: barnamedetail.BarnameDetailPage(recordId: recordId)),
          ),
        );
      },
    ),
  ],
);
