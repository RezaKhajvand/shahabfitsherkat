import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Basket/Utils/proxydecorator.dart';
import 'package:shahabfit/Features/barnameview/utils/setvideoplayercontroller.dart';
import 'package:shahabfit/Features/barnameview/utils/updateurl.dart';
import 'package:shahabfit/Widgets/mobile_layout.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/Activities/Bloc/ActivityBloc/activity_bloc.dart';
import 'package:shahabfit/Features/Activities/Models/CategoryModel.dart';
import 'package:shahabfit/Features/Activities/Widgets/CategoryBottomSheet.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/CustomErrorWidget.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:video_player/video_player.dart';

class ActivitiesPage extends StatefulWidget {
  final String basketId;
  final String tabIndex;
  const ActivitiesPage(
      {super.key, required this.basketId, required this.tabIndex});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? videoController;
  Timer? _timer;
  late TabController _tabController;
  late String categoryId;
  late String basketId;

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
    _tabController = TabController(
        length: weekDays.length,
        vsync: this,
        initialIndex: int.parse(widget.tabIndex));
    basketId = widget.basketId;
    categoryId = categoryList.first.id;
    BlocProvider.of<ActivityBloc>(context).add(GetActivityEvent(
        basketId: basketId,
        categoryId: categoryId,
        dayOfWeek: _tabController.index));
  }

  getActivityList() {
    updatePageUrl(_tabController.index);
    BlocProvider.of<ActivityBloc>(context).add(GetActivityEvent(
        basketId: basketId,
        categoryId: categoryId,
        dayOfWeek: _tabController.index));
  }

  searchActivity({required String value}) {
    _timer?.cancel();
    _timer = null;
    _timer = Timer(const Duration(milliseconds: 1000), () {
      BlocProvider.of<ActivityBloc>(context).add(GetActivityEvent(
          basketId: basketId,
          categoryId: categoryId,
          dayOfWeek: _tabController.index,
          searchValue: value));
    });
  }

  Future<VideoPlayerController> setVideo(String video) async {
    videoController = VideoPlayerController.networkUrl(
      Uri.parse(
        video.isEmpty ? testVideoLink : video,
      ),
    );
    await videoController!.initialize();
    videoController!.setLooping(true);
    videoController!.play();
    return videoController!;
  }

  @override
  void dispose() {
    videoController?.dispose();
    videoController = null;
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
          actionsPadding: EdgeInsets.only(left: 10),
          actions: [
            IconButton(
                onPressed: () =>
                    context.go('$createTamrinPage?basketId=$basketId'),
                icon: const Icon(Icons.edit)),
            SizedBox(width: 10),
            IconButton(
                onPressed: () => context.push(
                    '$basketPage?basketId=$basketId&tabIndex=${_tabController.index}'),
                icon: const Icon(Icons.shopping_basket)),
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
                          unselectedLabelStyle: context.anjomanLight,
                          labelStyle:
                              context.anjomanBold.copyWith(color: background),
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
                                      horizontal: 10, vertical: 20),
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
                                                  const WidgetStatePropertyAll(
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10))),
                                      onPressed: () async {
                                        String? resault =
                                            await customModalSheet(
                                                context,
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
        body: BlocConsumer<ActivityBloc, ActivityState>(
          listener: (context, state) {
            if (state is ActivityError) {
              getErrorSnackbar(context, state.errormsg);
            }
          },
          builder: (context, state) {
            if (state is ActivityLoaded) {
              var activityList = state.activity;
              var openBasket = state.openBasket;
              return ReorderableListView.builder(
                itemCount: activityList.length,
                buildDefaultDragHandles: false,
                key: Key(_tabController.index.toString()),
                proxyDecorator: (child, __, _) => proxyDecorator(child),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = activityList.removeAt(oldIndex);
                  activityList.insert(newIndex, item);
                  BlocProvider.of<ActivityBloc>(context)
                      .add(UpdateActivityEvent(activityList: activityList));
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    key: Key(activityList[index].id),
                    onLongPress: () {
                      showAdaptiveDialog(
                          context: context,
                          builder: (context) => Dialog(
                                backgroundColor: background,
                                child: SizedBox(
                                  width: mobileWidth,
                                  height: mobileWidth,
                                  child: FutureBuilder(
                                      future:
                                          setVideo(activityList[index].video),
                                      builder: (context, snapshot) {
                                        return snapshot.data == null
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : AspectRatio(
                                                aspectRatio: 1,
                                                child: VideoPlayer(
                                                    videoController!),
                                              );
                                      }),
                                ),
                              ));
                    },
                    child: Container(
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
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReorderableDragStartListener(
                              key: ObjectKey(widget),
                              index: index,
                              child: const Icon(
                                Icons.drag_handle,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 10),
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
                                      BlocProvider.of<ActivityBloc>(context)
                                          .add(DeleteActivityEvent(
                                              activity: activityList[index]));
                                    },
                                    icon: const Icon(Icons.delete_outline)),
                                const SizedBox(width: 5),
                                SizedBox(
                                  width: 50,
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
                                            BlocProvider.of<ActivityBloc>(
                                                    context)
                                                .add(InsertBasketActivityEvent(
                                                    basketId: basketId,
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
                                            var basketActivity = openBasket
                                                .firstWhere((element) =>
                                                    element.dayOfWeek ==
                                                        _tabController.index &&
                                                    element.activity ==
                                                        activity.id);
                                            BlocProvider.of<ActivityBloc>(
                                                    context)
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
                        )),
                  );
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
            customModalSheet(
              context,
              Scaffold(
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
                                          title: activityTitleController.text));
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
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
