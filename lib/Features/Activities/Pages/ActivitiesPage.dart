import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Bloc/ActivityBloc/activity_bloc.dart';
import 'package:shahabfit/Features/Activities/Models/CategoryModel.dart';
import 'package:shahabfit/Features/Activities/Widgets/CategoryBottomSheet.dart';
import 'package:shahabfit/Features/Basket/Pages/BasketPage.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/CustomErrorWidget.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/home_button.dart';

class ActivitiesPage extends StatefulWidget {
  final String? openBasketId;
  const ActivitiesPage({super.key, this.openBasketId});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  late TabController _tabController;
  late String categoryId;
  late String? openBasketId;

  final Map<int, String> weekDays = {
    0: 'جلسه اول',
    1: 'جلسه دوم',
    2: 'جلسه سوم',
    3: 'جلسه چهارم',
    4: 'جلسه پنجم',
    5: 'جلسه ششم',
    6: 'جلسه هفتم',
  };
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: weekDays.length, vsync: this);
    openBasketId = widget.openBasketId;
    categoryId = categoryList.first.id;
    getActivityList();
  }

  getActivityList() {
    BlocProvider.of<ActivityBloc>(context).add(GetActivityEvent(
        openBasketId: openBasketId,
        categoryId: categoryId,
        dayOfWeek: _tabController.index));
  }

  searchActivity({required String value}) {
    _timer?.cancel();
    _timer = null;
    _timer = Timer(const Duration(milliseconds: 1000), () {
      BlocProvider.of<ActivityBloc>(context).add(GetActivityEvent(
          categoryId: categoryId,
          dayOfWeek: _tabController.index,
          searchValue: value));
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

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
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text('برنامه تمرین',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
          actions: [
            const HomeButton(),
            IconButton(
                onPressed: () async {
                  await context.push(basketPage,
                      extra: BasketInputs(
                          basketId: openBasketId!,
                          tabIndex: _tabController.index));
                  getActivityList();
                },
                icon: const Icon(Icons.shopping_basket))
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.all(6),
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
                          onTap: (value) => getActivityList(),
                          controller: _tabController,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          unselectedLabelStyle: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300),
                          labelStyle: Theme.of(context).textTheme.labelLarge!,
                          tabs: List.generate(
                              weekDays.length,
                              (index) => Tab(
                                    text: weekDays[index],
                                  ))),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                onChanged: (value) =>
                                    searchActivity(value: value),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  filled: true,
                                  fillColor: Colors.white10,
                                  border: OutlineInputBorder(
                                      borderRadius: cardBorderRadius),
                                  hintText: 'جستجوی حرکت',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: Colors.white54,
                                          fontWeight: FontWeight.w300),
                                  suffixIconColor: Colors.white,
                                  isDense: true,
                                  suffixIcon: const Icon(
                                    Icons.search,
                                    size: 26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return OutlinedButton(
                                      style: Theme.of(context)
                                          .outlinedButtonTheme
                                          .style!
                                          .copyWith(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10))),
                                      onPressed: () async {
                                        String? resault =
                                            await showModalBottomSheet(
                                                backgroundColor: background,
                                                elevation: 0,
                                                isScrollControlled: true,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) =>
                                                    DraggableScrollableSheet(
                                                      minChildSize: 1,
                                                      maxChildSize: 1,
                                                      initialChildSize: 1,
                                                      builder: (context,
                                                              scrollController) =>
                                                          CategoryBottomSheet(
                                                              scrollController:
                                                                  scrollController,
                                                              categoryLit:
                                                                  categoryList),
                                                    ));
                                        if (resault != null) {
                                          setState(() => categoryId = resault);
                                          getActivityList();
                                        }
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            categoryList
                                                .firstWhere((element) =>
                                                    element.id == categoryId)
                                                .title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(color: primary),
                                          ),
                                          const Icon(Icons.arrow_forward_ios,
                                              size: 16)
                                        ],
                                      ));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        drawer: const CustomDrawer(),
        body: BlocConsumer<ActivityBloc, ActivityState>(
          listener: (context, state) {
            if (state is ActivityError) {
              getErrorSnackbar(context, state.errormsg);
            }
          },
          builder: (context, state) {
            if (state is ActivityLoaded) {
              var activityList = state.activity.items;
              var openBasket = state.openBasket;
              openBasketId = state.openBasketId;
              return ReorderableListView.builder(
                itemCount: activityList.length,
                key: Key(_tabController.index.toString()),
                proxyDecorator: (child, index, animation) =>
                    proxyDecorator(child, index, animation),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                onReorder: (oldIndex, newIndex) {
                  var qadimIndex = 0;
                  var jadidIndex = 0;
                  if (newIndex > oldIndex) {
                    print('$oldIndex  - ${newIndex - 1}');
                    qadimIndex = oldIndex;
                    jadidIndex = newIndex - 1;
                  } else {
                    print('$oldIndex - $newIndex');
                    qadimIndex = oldIndex;
                    jadidIndex = newIndex;
                  }
                  BlocProvider.of<ActivityBloc>(context).add(
                      UpdateActivityEvent(
                          firstIndexId: activityList[jadidIndex].id,
                          secIndexId: activityList[qadimIndex].id,
                          firstNumberView: jadidIndex,
                          secNumberView: qadimIndex));
                },
                itemBuilder: (context, index) {
                  return Container(
                      key: Key(activityList[index].id),
                      margin: EdgeInsets.only(
                          bottom: index != activityList.length - 1 ? 14 : 0),
                      decoration: ShapeDecoration(
                        color: background,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: borderColor,
                          ),
                          borderRadius: cardBorderRadius,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  activityList[index].title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  'اولویت : ${replaceFarsiNumber(activityList[index].numberView.toString())}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<ActivityBloc>(context).add(
                                        DeleteActivityEvent(
                                            activity: activityList[index]));
                                  },
                                  icon: const Icon(Icons.delete_outline)),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 60,
                                child: Builder(builder: (context) {
                                  if (activityList[index].id ==
                                      state.loadingItem) {
                                    return const Center(
                                      child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator()),
                                    );
                                  }
                                  return Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Switch(
                                      value: activityList[index].isInBasket,
                                      onChanged: (value) async {
                                        var activity = activityList[index];
                                        if (value) {
                                          BlocProvider.of<ActivityBloc>(context)
                                              .add(InsertBasketActivityEvent(
                                                  activitySet: [
                                                [3, 10]
                                              ],
                                                  dayOfWeek:
                                                      _tabController.index,
                                                  categoryId: categoryId,
                                                  activityId: activity.id,
                                                  title: activity.title,
                                                  isInBasket: value));
                                        } else {
                                          var basketActivity = openBasket.items
                                              .firstWhere((element) =>
                                                  element.dayOfWeek ==
                                                      _tabController.index &&
                                                  element.activity ==
                                                      activity.id);

                                          BlocProvider.of<ActivityBloc>(context)
                                              .add(DeleteBasketActivityEvent(
                                                  basketActivityId:
                                                      basketActivity.id,
                                                  categoryId: categoryId,
                                                  activityId: activity.id,
                                                  title: activity.title,
                                                  isInBasket: value));
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )
                        ],
                      ));
                },
              );
            }
            if (state is ActivityError) {
              return CustomErrorWidget(
                  errormsg: state.errormsg, onPressed: getActivityList);
            }
            return const LoadingWidget();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final TextEditingController activityTitleController =
                TextEditingController();
            showModalBottomSheet(
              backgroundColor: background,
              barrierColor: Colors.transparent,
              elevation: 0,
              shape: const RoundedRectangleBorder(),
              isScrollControlled: true,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return Scaffold(
                  appBar: AppBar(title: const Text('افزودن حرکت')),
                  body: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextFormField(
                              style: Theme.of(context).textTheme.labelSmall,
                              controller: activityTitleController,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                hintText: 'نام حرکت',
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primary),
                                  onPressed: () {
                                    BlocProvider.of<ActivityBloc>(context).add(
                                        InsertActivityEvent(
                                            categoryId: categoryId,
                                            dayOfWeek: _tabController.index,
                                            title:
                                                activityTitleController.text));
                                  },
                                  child: const Text('افزودن')),
                            )
                          ],
                        ),
                      ),
                      BlocConsumer<ActivityBloc, ActivityState>(
                        listener: (context, state) {
                          if (state is ActivityLoaded) {
                            context.pop();
                          }
                        },
                        builder: (context, state) {
                          if (state is ActivityLoading) {
                            return const Material(
                              color: Colors.black54,
                              child: LoadingWidget(),
                            );
                          }
                          return const SizedBox();
                        },
                      )
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}