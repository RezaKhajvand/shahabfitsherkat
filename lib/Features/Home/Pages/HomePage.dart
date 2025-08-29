import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Utils/apptab.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/utils/texttheme.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  final String currentRoute;
  const HomePage({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.onlyShowSelected;
  late PageController controller;
  final List<String> userAccess = AuthManager.readAccess();

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    // تب‌های مجاز
    final allowedTabs =
        allTabs.where((t) => userAccess.contains(t.id)).toList();
    // پیدا کردن ایندکس بر اساس route
    int currentPageIndex =
        allowedTabs.indexWhere((t) => t.route == widget.currentRoute);
    if (currentPageIndex == -1) currentPageIndex = 0; // fallback

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
              context.go(allowedTabs[index].route);
            },
            destinations: allowedTabs.map((tab) {
              return NavigationDestination(
                icon: Icon(tab.icon, color: Colors.white30, size: 25),
                selectedIcon: Icon(tab.selectedIcon, color: Colors.black),
                label: tab.label,
              );
            }).toList(),
          );
        }),
        body: widget.child);
  }
}

int safeIndex(int index, int max) {
  if (index >= max) return 0; // برگرده به اولین تب
  return index;
}
