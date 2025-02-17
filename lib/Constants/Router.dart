import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Activities/Pages/ActivitiesPage.dart';
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart';
import 'package:shahabfit/Features/Basket/Widgets/SystemPickerPage.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/trainer_screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_list_screen.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/Home/Pages/HomePage.dart';
import 'package:shahabfit/Features/Splash/SplashPage.dart';
import 'package:shahabfit/Features/System/Pages/SystemPage.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/updateshagerd/update_shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/editpage.dart';
import 'package:shahabfit/Features/oldversion/managepage.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/Features/oldversion/searchpage.dart';

const String activitiesPage = '/activities';
const String basketListPage = '/basketlist';
const String systemPage = '/system';
const String homePage = '/base';
const String mainPage = '/main';
const String splashPage = '/splash';
const String basketPage = '/basket';
const String systemPickerPage = '/systempicker';
const String dayliMealPage = '/daylimeal';
const String trainerPage = '/trainer';
const String shagerdSearchPage = '/shagerdsearch';
const String daylimealListPage = '/daylimeallist';
const String editShagerdPage = '/editshagerd';
// GoRouter configuration
final router = GoRouter(
  initialLocation: splashPage,
  routes: [
    GoRoute(
      path: splashPage,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: homePage,
      builder: (context, state) => const ManagePage(),
    ),
    GoRoute(
      path: systemPickerPage,
      builder: (context, state) => const SystemPickerPage(),
    ),
    GoRoute(
      path: activitiesPage,
      builder: (context, state) => ActivitiesPage(
        openBasketId: state.extra as String?,
      ),
    ),
    GoRoute(
      path: basketPage,
      builder: (context, state) =>
          BasketPage(basketInputs: state.extra as BasketInputs),
    ),
    GoRoute(
      path: systemPage,
      builder: (context, state) => const SystemPage(),
    ),
    GoRoute(
      path: basketListPage,
      builder: (context, state) => const BasketListPage(),
    ),
    GoRoute(
      path: mainPage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: dayliMealPage,
        builder: (context, state) {
          final trainer = state.extra as Trainer;
          return DaylimealScreen(trainer: trainer);
        }),
    GoRoute(
      path: trainerPage,
      builder: (context, state) {
        final trainer = state.extra as Trainer?;
        return TrainerScreen(trainer: trainer);
      },
    ),
    GoRoute(
      path: daylimealListPage,
      builder: (context, state) => const DayliMealListScreen(),
    ),
    GoRoute(
      path: editShagerdPage,
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return BlocProvider(
          create: (context) => UpdateShagerdBloc(),
          child: EditPage(
              shagerd: extra["shagerd"] as Shagerd,
              shagerdList: extra["shagerdList"] as List<Shagerd>),
        );
      },
    ),
    GoRoute(
      path: shagerdSearchPage,
      builder: (context, state) => BlocProvider(
        create: (context) => ShagerdBloc(),
        child: const SearchPage(),
      ),
    ),
  ],
);
