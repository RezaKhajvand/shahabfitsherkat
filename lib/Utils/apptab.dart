import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/Router.dart';

class AppTab {
  final String id;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String route;

  AppTab({
    required this.id,
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.route,
  });
}

final List<AppTab> allTabs = [
  AppTab(
    id: "0",
    label: "حضورغیاب",
    icon: Icons.list_alt_rounded,
    selectedIcon: Icons.list_alt_rounded,
    route: managePage,
  ),
  AppTab(
    id: "1",
    label: "تمرینی",
    icon: Icons.fitness_center_rounded,
    selectedIcon: Icons.fitness_center_rounded,
    route: basketListPage,
  ),
  AppTab(
    id: "2",
    label: "غذایی",
    icon: Icons.fastfood_outlined,
    selectedIcon: Icons.fastfood,
    route: daylimealListPage,
  ),
  AppTab(
    id: "3",
    label: "کاربری",
    icon: Icons.person_4_outlined,
    selectedIcon: Icons.person_4,
    route: profilePage,
  ),
];
