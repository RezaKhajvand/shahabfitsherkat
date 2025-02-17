import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Features/oldversion/utils/shagerdtype.dart';
import 'package:shahabfit/Features/oldversion/widgets/shagerdlist.dart';
import 'package:shahabfit/Widgets/home_button.dart';
import 'package:shahabfit/main.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        image: DecorationImage(
          image: AssetImage('images/shahabbg.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: ScaffoldMessenger(
          key: globalKey,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            drawer: const CustomDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              actions: [
                const HomeButton(),
                IconButton(
                    onPressed: () async {
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     fullscreenDialog: true,
                      //     builder: (context) => TimePage(),
                      //   ),
                      // );

                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.watch_later,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () async => context.push(shagerdSearchPage),
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ],
              title: Text('حضور و غیاب',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white)),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(70),
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  decoration: ShapeDecoration(
                    color: background,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: borderColor,
                      ),
                      borderRadius: tabBorderRadius,
                    ),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    padding: const EdgeInsets.all(10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: primary,
                      borderRadius: tabBorderRadius,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white.withOpacity(0.8),
                    labelStyle: Theme.of(context).textTheme.labelMedium,
                    unselectedLabelStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontWeight: FontWeight.w300),
                    tabs: const [
                      Tab(text: 'همه'),
                      Tab(text: 'خصوصی'),
                      Tab(text: 'منقضی'),
                    ],
                  ),
                ),
              ),
            ),
            body: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ShagerdList(type: ShagerdType.all),
                ShagerdList(type: ShagerdType.khosusi),
                ShagerdList(type: ShagerdType.monqzi),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: primary,
              onPressed: () async {
                // bool? resault = await Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       fullscreenDialog: true,
                //       builder: (context) => const AddPage(),
                //     ));
                // if (resault == true) {
                //   setState(() {});
                // }
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
