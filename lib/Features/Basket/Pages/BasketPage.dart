import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Basket/Utils/proxydecorator.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/Features/Basket/Utils/basketinput.dart';
import 'package:shahabfit/Features/Basket/Widgets/SetRow.dart';
import 'package:shahabfit/Features/Basket/Widgets/SystemPicker.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/CustomErrorWidget.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/home_button.dart';

class BasketPage extends StatefulWidget {
  final BasketInputs basketInputs;
  const BasketPage({super.key, required this.basketInputs});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int categiryIndex;

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
        initialIndex: widget.basketInputs.tabIndex);
    getBasketItems();
  }

  void getBasketItems() {
    BlocProvider.of<BasketBloc>(context)
        .add(GetBasketEvent(basketId: widget.basketInputs.basketId));
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
          actions: [
            const HomeButton(),
            IconButton(
                onPressed: () => context.push(
                    '$barnameViewPage?basketId=${widget.basketInputs.basketId}&tabIndex=0'),
                icon: Icon(Icons.share)),
          ],
          title: Text('سبد تمرین',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
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
                          onTap: (value) => getBasketItems(),
                          controller: _tabController,
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          unselectedLabelStyle: context.anjomanLight,
                          labelStyle:
                              context.anjomanBold.copyWith(color: background),
                          tabs: List.generate(weekDays.length,
                              (index) => Tab(text: weekDays[index]))),
                    ),
                  ],
                ),
              )),
        ),
        body: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            if (state is BasketLoaded) {
              var basketActivity = state.basketActivity
                  .where((element) => element.dayOfWeek == _tabController.index)
                  .toList();
              return ReorderableListView.builder(
                buildDefaultDragHandles: false,
                proxyDecorator: (child, __, _) => proxyDecorator(child),
                onReorder: (oldIndex, newIndex) {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = basketActivity.removeAt(oldIndex);
                  basketActivity.insert(newIndex, item);
                  BlocProvider.of<BasketBloc>(context).add(
                      ChangeNumberViewEvent(basketActivity: basketActivity));
                },
                itemCount: basketActivity.length,
                key: Key(_tabController.index.toString()),
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  var activity = basketActivity[index].expand.activity;
                  var activitySet = basketActivity[index].activitySet;
                  return Container(
                      key: Key(basketActivity[index].id),
                      margin: EdgeInsets.only(
                          bottom: index != basketActivity.length - 1 ? 12 : 0),
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
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  activity?.title ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                              ReorderableDragStartListener(
                                  key: ObjectKey(widget),
                                  index: index,
                                  child:
                                      const Icon(Icons.drag_handle, size: 30)),
                              SizedBox(width: 6),
                              IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<BasketBloc>(context).add(
                                          DeleteBasketEvent(
                                              basketActivityId:
                                                  basketActivity[index].id)),
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.white30,
                                  ))
                            ],
                          ),
                          Divider(
                              height: 30,
                              thickness: 0.5,
                              color: Colors.white24),
                          SystemPicker(basketActivity: basketActivity[index]),
                          const SizedBox(height: 20),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: activitySet.length,
                            itemBuilder: (context, setindex) {
                              return SetRowItem(
                                basketActivity: basketActivity[index],
                                setIndex: setindex,
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 14),
                          ),
                        ],
                      ));
                },
              );
            }
            if (state is BasketError) {
              return CustomErrorWidget(
                  errormsg: state.errormsg, onPressed: getBasketItems);
            }
            return LoadingWidget();
          },
        ),
      ),
    );
  }
}
