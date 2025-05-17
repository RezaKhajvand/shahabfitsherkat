import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/constants/Router.dart';
import 'package:shahabfit/utils/texttheme.dart';

class HomePage extends StatefulWidget {
  // final String tabIndex;
  final Widget child;
  const HomePage({
    super.key,
    // required this.tabIndex,
    required this.child,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    var tabIndex = 0;
    //  int.parse(widget.tabIndex);
    controller = PageController(initialPage: tabIndex);
    currentPageIndex = tabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: StatefulBuilder(builder: (context, setState) {
          return NavigationBar(
            backgroundColor: navigationColor,
            indicatorColor: primary,
            surfaceTintColor: Colors.white,
            overlayColor: WidgetStateProperty.all(Colors.white10),
            labelTextStyle: WidgetStateProperty.all(context.anjomanLight
                .copyWith(fontSize: 14, color: Colors.white60)),
            labelBehavior: labelBehavior,
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() => currentPageIndex = index);
              _onItemTapped(index, context);
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
          );
        }),
        body: widget.child);
  }
}

void _onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      context.go(managePage);
    case 1:
      context.go(basketListPage);
    case 2:
      context.go(daylimealListPage);
    case 3:
      context.go(profilePage);
  }
}
