import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    final String? location = GoRouterState.of(context).path;
    return SafeArea(
      child: Drawer(
        backgroundColor: background,
        elevation: 0,
        width: 240,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: primary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    const Text("شهاب حسینی"),
                    const SizedBox(height: 6),
                    Text("ShahabHoseini",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            getDrawerItem(
              title: "برنامه تمرین",
              icon: Icons.pause_presentation,
              isActive: location == activitiesPage,
              onTap: () => context.pushReplacement(activitiesPage),
              context: context,
            ),
            const SizedBox(height: 10),
            getDrawerItem(
              title: "لیست برنامه ها",
              icon: Icons.shopping_basket_outlined,
              isActive: location == basketListPage,
              onTap: () => context.pushReplacement(basketListPage),
              context: context,
            ),
            const SizedBox(height: 10),
            getDrawerItem(
              title: "لیست سیستم ها",
              icon: Icons.sports_outlined,
              isActive: location == systemPage,
              onTap: () => context.pushReplacement(systemPage),
              context: context,
            ),
           
          ],
        ),
      ),
    );
  }
}

Padding getDrawerItem({
  required final String title,
  required final IconData icon,
  required bool isActive,
  required BuildContext context,
  void Function()? onTap,
}) {
  Color listTileColor = !isActive ? Colors.white : Colors.black;
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Stack(
      alignment: Alignment.center,
      children: [
        isActive
            ? Container(
                height: 55,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: primary, borderRadius: oneSideBorderRadius),
              )
            : const SizedBox(),
        ListTile(
          shape:
              const RoundedRectangleBorder(borderRadius: oneSideBorderRadius),
          textColor: listTileColor,
          iconColor: listTileColor,
          titleTextStyle: Theme.of(context).textTheme.labelSmall,
          leading: Icon(icon),
          title: Text(title),
          onTap: onTap,
        ),
      ],
    ),
  );
}
