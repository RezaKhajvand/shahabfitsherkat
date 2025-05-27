import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/Daylimeal/bloc/daylimeal_list_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/utils/texttheme.dart';

class DayliMealListScreen extends StatefulWidget {
  const DayliMealListScreen({super.key});

  @override
  DayliMealListScreenState createState() => DayliMealListScreenState();
}

class DayliMealListScreenState extends State<DayliMealListScreen> {
  @override
  void initState() {
    super.initState();
    fetchDaylimealList();
  }

  fetchDaylimealList() =>
      BlocProvider.of<DaylimealListBloc>(context).add(DaylimealListEvent());
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          onPressed: () => context.push(trainerPage),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(title: Text('غذایی', style: context.anjomanBlack)),
        body: BlocBuilder<DaylimealListBloc, DaylimealListState>(
          builder: (context, state) {
            if (state is DaylimealListLoaded) {
              final daylimealList = state.daylimelaList;
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: daylimealList.length,
                itemBuilder: (context, index) {
                  final meal = daylimealList[index];
                  return InkWell(
                    onTap: () =>
                        context.go('$trainerPage?barnameId=${meal.id}'),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: background,
                        shape: RoundedRectangleBorder(
                            side:
                                const BorderSide(width: 1, color: borderColor),
                            borderRadius: cardBorderRadius),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'کالری  ${replaceFarsiNumber(meal.calories.toString())}',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              );
            }
            if (state is DaylimealListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DaylimealListError) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errormessage,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: double.infinity, height: 10),
                  ElevatedButton(
                      onPressed: () => fetchDaylimealList(),
                      child: const Text('تلاش مجدد')),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
