import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Features/OldVersion/widgets/shagerdlist.dart';
import 'package:shahabfit/Widgets/home_button.dart';
import 'package:shahabfit/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
                  onPressed: () async {
                    // await Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     fullscreenDialog: true,
                    //     builder: (context) => const SearchPage(),
                    //   ),
                    // );

                    setState(() {});
                  },
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
                  onTap: (value) {
                    controller.jumpTo(0);
                  },
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
              ShagerdList(),
              ShagerdList(),
              ShagerdList(),
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
    );
  }
}
