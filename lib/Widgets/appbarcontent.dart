import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/landing/models/menuitem.dart';
import 'package:shahabfit/Features/landing/utils/fontsize.dart';
import 'package:shahabfit/Features/landing/utils/padding.dart';
import 'package:shahabfit/utils/texttheme.dart';

const double appbarHeight = 70;

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final void Function(GlobalKey key) scrollToItem;
  final List<MenuItem> menuItems;
  const CustomAppbar(
      {super.key, required this.scrollToItem, required this.menuItems});

  @override
  Size get preferredSize => const Size.fromHeight(appbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 750) {
      return AppBar(
        backgroundColor: background,
        centerTitle: true,
        toolbarHeight: appbarHeight,
        title: Image.asset('images/logo.png', width: 120),
        leadingWidth: screenWidth < 600 ? 80 : 150,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getPadding(screenWidth)),
              child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ],
        ),
      );
    }

    return AppBar(
      backgroundColor: background,
      centerTitle: true,
      leadingWidth: double.infinity,
      toolbarHeight: appbarHeight,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPadding(screenWidth)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', width: 120),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: screenWidth / 2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    menuItems.length,
                    (index) => TextButton(
                      onPressed: () => scrollToItem(menuItems[index].key),
                      child: Text(
                        menuItems[index].title,
                        style: context.anjomanMedium.copyWith(
                            color: textColor,
                            fontSize: getFontSize(screenWidth) - 4),
                      ),
                    ),
                  )),
            ),
            OutlinedButton(
                onPressed: () async => context.go(mainPage),
                child: const Text('ورود به اپ'))
          ],
        ),
      ),
    );
  }
}
