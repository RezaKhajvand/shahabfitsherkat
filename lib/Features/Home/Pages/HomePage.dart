import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/BasketList/Pages/BasketListPage.dart';
import 'package:shahabfit/Features/Daylimeal/Pages/daylimeal_list_screen.dart';
import 'package:shahabfit/Features/login/data/fingerprint.dart';
import 'package:shahabfit/Features/oldversion/managepage.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/utils/texttheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: navigationColor,
          indicatorColor: primary,
          surfaceTintColor: Colors.white,
          overlayColor: WidgetStateProperty.all(Colors.white10),
          labelTextStyle: WidgetStateProperty.all(context.anjomanLight
              .copyWith(fontSize: 14, color: Colors.white60)),
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
            controller.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.list_alt_rounded,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.list_alt_rounded,
                color: Colors.white30,
                size: 25,
              ),
              label: 'حضورغیاب',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.fitness_center_rounded,
                color: Colors.black,
              ),
              icon: Icon(
                Icons.fitness_center_rounded,
                color: Colors.white30,
                size: 25,
              ),
              label: 'تمرینی',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.fastfood_outlined,
                color: Colors.white30,
                size: 25,
              ),
              selectedIcon: Icon(Icons.fastfood),
              label: 'غذایی',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_4_outlined,
                color: Colors.white30,
                size: 25,
              ),
              selectedIcon: Icon(Icons.person_4),
              label: 'کاربری',
            ),
          ],
        ),
        body: PageView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ManagePage(),
            BasketListPage(),
            DayliMealListScreen(),
            Scaffold(
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
                body: Center(child: Text('کاربری')))
          ],
        ));
  }
}
