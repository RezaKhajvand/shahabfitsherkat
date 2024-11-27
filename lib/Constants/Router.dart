import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Activities/Pages/ActivitiesPage.dart';
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart';
import 'package:shahabfit/Features/Basket/Widgets/SystemPickerPage.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/Daylimeal_Screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/Trainer_Screen.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/Home/Pages/HomePage.dart';
import 'package:shahabfit/Features/Splash/SplashPage.dart';
import 'package:shahabfit/Features/System/Pages/SystemPage.dart';
import 'package:shahabfit/main.dart';

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
      builder: (context, state) => const BasePage(),
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
      builder: (context, state) => const TrainerScreen(),
    ),
  ],
);
