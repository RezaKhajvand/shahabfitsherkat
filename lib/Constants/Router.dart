import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Activities/Pages/ActivitiesPage.dart';
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart';
import 'package:shahabfit/Features/Basket/Utils/basketinput.dart';
import 'package:shahabfit/Features/Basket/Widgets/SystemPickerPage.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/trainer_screen.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_list_screen.dart';
import 'package:shahabfit/Features/Daylimeal/models/trainer_model.dart';
import 'package:shahabfit/Features/Home/Pages/HomePage.dart';
import 'package:shahabfit/Features/Splash/SplashPage.dart';
import 'package:shahabfit/Features/System/Pages/SystemPage.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/barnameview/page/barnamedetail_screen.dart';
import 'package:shahabfit/Features/barnameview/page/barnameview_screen.dart';
import 'package:shahabfit/Features/landing/view/blog_screen.dart';
import 'package:shahabfit/Features/landing/view/landing_screen.dart';
import 'package:shahabfit/Features/login/view/loginpage.dart';
import 'package:shahabfit/Features/oldversion/addpage.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/editpage.dart';
import 'package:shahabfit/Features/oldversion/managepage.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/Features/oldversion/searchpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String landingPage = '/';
const String loginPage = '/login';
const String blogPage = '/blog';
const String activitiesPage = '/activities';
const String basketListPage = '/basketlist';
const String systemPage = '/system';
const String managePage = '/manage';
const String mainPage = '/main';
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
// GoRouter configuration
final router = GoRouter(
  initialLocation: loginPage,
  redirect: (context, state) async {
    final share = await SharedPreferences.getInstance();
    final user = share.getString("user");

    if (user == null) {
      if (state.uri.path.contains(barnameViewPage) ||
          state.uri.path.contains(barnameDetailPage)) {
        return null;
      }
      return loginPage;
    }
    return null;
  },
  routes: [
    //landing
    GoRoute(
      path: landingPage,
      builder: (context, state) => const LandingScreen(
        key: ValueKey(landingPage),
      ),
    ),
    GoRoute(
      path: '$blogPage/:blogId',
      builder: (context, state) => BlogScreen(
        blogId: int.parse(state.pathParameters["blogId"]!),
        key: ValueKey(blogPage),
      ),
    ),
    //mobile
    GoRoute(
      path: loginPage,
      builder: (context, state) => MobileLayout(child: const LoginPage()),
    ),
    GoRoute(
      path: splashPage,
      builder: (context, state) => MobileLayout(child: SplashScreen()),
    ),
    GoRoute(
      path: managePage,
      builder: (context, state) => MobileLayout(child: const ManagePage()),
    ),
    GoRoute(
      path: systemPickerPage,
      builder: (context, state) =>
          MobileLayout(child: const SystemPickerPage()),
    ),
    GoRoute(
      path: activitiesPage,
      builder: (context, state) => MobileLayout(
        child: ActivitiesPage(
          openBasketId: state.extra as String?,
        ),
      ),
    ),
    GoRoute(
      path: basketPage,
      builder: (context, state) {
        final basketId = (state.uri.queryParameters['basketId'] ?? 'basketId');
        final tabIndex = (state.uri.queryParameters['tabIndex'] ?? '0');
        return MobileLayout(
          child: BasketPage(
              basketInputs: BasketInputs(
                  basketId: basketId, tabIndex: int.parse(tabIndex))),
        );
      },
    ),
    GoRoute(
      path: systemPage,
      builder: (context, state) => MobileLayout(child: const SystemPage()),
    ),
    GoRoute(
      path: basketListPage,
      builder: (context, state) => MobileLayout(child: const BasketListPage()),
    ),
    GoRoute(
      path: mainPage,
      builder: (context, state) => MobileLayout(child: const HomePage()),
    ),
    GoRoute(
        path: dayliMealPage,
        builder: (context, state) {
          final trainer = state.extra as Trainer;
          return MobileLayout(child: DaylimealScreen(trainer: trainer));
        }),
    GoRoute(
      path: trainerPage,
      builder: (context, state) {
        final trainer = state.extra as Trainer?;
        return MobileLayout(child: TrainerScreen(trainer: trainer));
      },
    ),
    GoRoute(
      path: daylimealListPage,
      builder: (context, state) =>
          MobileLayout(child: const DayliMealListScreen()),
    ),
    GoRoute(
      path: editShagerdPage,
      builder: (context, state) {
        final extra = state.extra as Shagerd;
        return MobileLayout(child: EditPage(shagerd: extra));
      },
    ),
    GoRoute(
        path: createShagerdPage,
        builder: (context, state) => MobileLayout(child: AddPage())),
    GoRoute(
      path: shagerdSearchPage,
      builder: (context, state) => BlocProvider(
        create: (context) => ShagerdBloc(),
        child: MobileLayout(child: const SearchPage()),
      ),
    ),
    GoRoute(
        path: barnameViewPage,
        builder: (context, state) {
          final basketId =
              (state.uri.queryParameters['basketId'] ?? 'basketId');
          final tabIndex = (state.uri.queryParameters['tabIndex'] ?? '0');
          return MultiBlocProvider(
            providers: [BlocProvider(create: (context) => BarnameViewBloc())],
            child: MobileLayout(
                child: BarnameViewPage(
              basketId: basketId,
              tabIndex: tabIndex,
            )),
          );
        }),
    GoRoute(
        path: barnameDetailPage,
        builder: (context, state) {
          final recordId =
              (state.uri.queryParameters['recordId'] ?? 'recordId');
          return MultiBlocProvider(
            providers: [BlocProvider(create: (context) => BarnameViewBloc())],
            child: MobileLayout(child: BarnameDetailPage(recordId: recordId)),
          );
        }),
  ],
);
const double mobileWidth = 400;
const double tabletWidth = 600;

class MobileLayout extends StatelessWidget {
  final Widget child;
  const MobileLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > tabletWidth) {
        return Center(child: SizedBox(width: mobileWidth, child: child));
      }
      return child;
    });
  }
}
