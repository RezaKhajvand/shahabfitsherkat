import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/deleteActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/getActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/deleteBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/insertActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/updateActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/insertBasketDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/ActivityModel.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/insertBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/InsertBasketActivityModel.dart';
import 'package:shahabfit/Features/Activities/Models/OpenBasketModel.dart';
part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  late ActivityList activity;
  late BasketActivity openBasket;
  late String openBasketId;
  ActivityBloc() : super(ActivityLoading()) {
    on<GetActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        if (event.openBasketId != null) {
          openBasketId = event.openBasketId!;
        } else {
          var openBasketList = openBasketFromJson(await getOpenBasket());
          if (openBasketList.items.isNotEmpty) {
            openBasketId = openBasketList.items.first.id;
          } else {
            openBasketId =
                BasketRecord.fromJson(json.decode(await insertBasket())).id;
          }
        }

        var futureResault = await Future.wait([
          getActivity(catId: event.categoryId),
          getOpenBasketActivity(basketId: openBasketId)
        ]);
        activity = activityListFromJson(futureResault.first);
        openBasket = basketActivityFromJson(futureResault.last);
        print(openBasket.items.length);
        for (var activity in activity.items) {
          if (openBasket.items.any((element) =>
              element.activity == activity.id &&
              element.dayOfWeek == event.dayOfWeek)) {
            activity.isInBasket = true;
          } else {
            activity.isInBasket = false;
          }
        }
        if (event.searchValue != null) {
          activity.items.removeWhere(
              (element) => !element.title.contains(event.searchValue!));
        }
        sortItems();
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } on DioException catch (e) {
        emit((ActivityError(
            errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });
    on<InsertActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        var activityRecord = ActivityRecord.fromJson(json.decode(
            await insertActivity(catId: event.categoryId, title: event.title)));
        activity.items.add(activityRecord);
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } on DioException catch (e) {
        emit((ActivityError(
            errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });
    on<UpdateActivityEvent>((event, emit) async {
      try {
        updateActivity(
            activityId: event.firstIndexId, numberView: event.secNumberView);
        updateActivity(
            activityId: event.secIndexId, numberView: event.firstNumberView);

        activity.items
            .firstWhere((element) => element.id == event.firstIndexId)
            .numberView = event.secNumberView;
        activity.items
            .firstWhere((element) => element.id == event.secIndexId)
            .numberView = event.firstNumberView;
        sortItems();
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });

    on<DeleteActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        await deleteActivity(activityId: event.activity.id);
        activity.items.remove(event.activity);
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } on DioException catch (e) {
        emit((ActivityError(
            errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });
    on<InsertBasketActivityEvent>((event, emit) async {
      emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
          openBasketId: openBasketId,
          loadingItem: event.activityId)));
      try {
        var insertedBasketActivity = insertBasketActivityFromJson(
            await insertBasketActivity(
                basket: openBasketId,
                dayOfWeek: event.dayOfWeek,
                activity: event.activityId,
                activitySet: event.activitySet));

        updateActivity(
            activityId: event.activityId,
            title: event.title,
            catId: event.categoryId,
            isInBasket: event.isInBasket);
        final ActivityRecord updatedActivity = activity.items
            .firstWhere((element) => element.id == event.activityId);
        updatedActivity.catId = event.categoryId;
        updatedActivity.isInBasket = event.isInBasket;
        updatedActivity.title = event.title;
        //
        openBasket.items.add(ActivityItem(
            numberView: 0,
            activity: event.activityId,
            activitySet: event.activitySet,
            basket: openBasketId,
            dayOfWeek: event.dayOfWeek,
            collectionId: insertedBasketActivity.collectionId,
            collectionName: insertedBasketActivity.collectionName,
            created: insertedBasketActivity.created,
            updated: insertedBasketActivity.updated,
            system: insertedBasketActivity.system,
            systemSubId: insertedBasketActivity.systemSubId,
            id: insertedBasketActivity.id,
            expand: Expand()));
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } on DioException catch (e) {
        emit((ActivityError(
            errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });
    on<DeleteBasketActivityEvent>((event, emit) async {
      try {
        deleteBasketActivity(basketActivityId: event.basketActivityId);
        updateActivity(
            activityId: event.activityId,
            title: event.title,
            catId: event.categoryId,
            isInBasket: event.isInBasket);
        final ActivityRecord updatedActivity = activity.items
            .firstWhere((element) => element.id == event.activityId);
        updatedActivity.catId = event.categoryId;
        updatedActivity.isInBasket = event.isInBasket;
        updatedActivity.title = event.title;
        openBasket.items
            .removeWhere((element) => element.id == event.basketActivityId);
        emit((ActivityLoaded(
            openBasket: openBasket,
            activity: activity,
            openBasketId: openBasketId)));
      } on DioException catch (e) {
        emit((ActivityError(
            errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
      } catch (e) {
        emit((ActivityError(errormsg: e.toString())));
      }
    });
  }
  sortItems() {
    activity.items.sort((a, b) => a.numberView.compareTo(b.numberView));
  }
}
