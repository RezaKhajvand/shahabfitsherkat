import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/deleteActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/getActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/deleteBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/insertActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/ActivityCollection/updateActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/ActivityModel.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/insertBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/InsertBasketActivityModel.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  late List<ActivityRecord> activity;
  late List<ActivityItem> openBasket;

  ActivityBloc() : super(ActivityLoading()) {
    on<GetActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        var futureResault = await Future.wait([
          getActivity(catId: event.categoryId),
          getOpenBasketActivity(basketId: event.basketId)
        ]);
        activity = activityListFromJson(futureResault.first);
        openBasket = basketActivityFromJson(futureResault.last);

        for (var activity in activity) {
          if (openBasket.any((element) =>
              element.activity == activity.id &&
              element.dayOfWeek == event.dayOfWeek)) {
            activity.isInBasket = true;
          } else {
            activity.isInBasket = false;
          }
        }
        if (event.searchValue != null) {
          activity.removeWhere(
              (element) => !element.title.contains(event.searchValue!));
        }
        sortItems();
        emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
      }
    });
    on<InsertActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        var activityRecord = ActivityRecord.fromJson(json.decode(
            await insertActivity(catId: event.categoryId, title: event.title)));
        activity.add(activityRecord);
        emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
      }
    });
    on<UpdateActivityEvent>((event, emit) async {
      try {
        var newShagerdList = event.activityList;
        Future.wait(List.generate(newShagerdList.length, (index) {
          newShagerdList[index].numberView = index;
          return updateActivity(
              activityId: newShagerdList[index].id, numberView: index);
        }));
        activity = newShagerdList;
        emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
      }
    });
    on<DeleteActivityEvent>((event, emit) async {
      emit((ActivityLoading()));
      try {
        await deleteActivity(activityId: event.activity.id);
        activity.remove(event.activity);
        emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
      }
    });
    on<InsertBasketActivityEvent>((event, emit) async {
      emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
          loadingItem: event.activityId)));
      try {
        var insertedBasketActivity = insertBasketActivityFromJson(
            await insertBasketActivity(
                basket: event.basketId,
                dayOfWeek: event.dayOfWeek,
                activity: event.activityId,
                activitySet: event.activitySet));
        updateActivity(
            activityId: event.activityId,
            title: event.title,
            catId: event.categoryId,
            isInBasket: event.isInBasket);
        final ActivityRecord updatedActivity =
            activity.firstWhere((element) => element.id == event.activityId);
        updatedActivity.catId = event.categoryId;
        updatedActivity.isInBasket = event.isInBasket;
        updatedActivity.title = event.title;
        //
        openBasket.add(ActivityItem(
            numberView: 0,
            activity: event.activityId,
            activitySet: event.activitySet,
            basket: event.basketId,
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
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
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
        final ActivityRecord updatedActivity =
            activity.firstWhere((element) => element.id == event.activityId);
        updatedActivity.catId = event.categoryId;
        updatedActivity.isInBasket = event.isInBasket;
        updatedActivity.title = event.title;
        openBasket
            .removeWhere((element) => element.id == event.basketActivityId);
        emit((ActivityLoaded(
          openBasket: openBasket,
          activity: activity,
        )));
      } catch (e, s) {
        emit((ActivityError(errormsg: handleException(e, s))));
      }
    });
  }
  void sortItems() {
    activity.sort((a, b) => a.numberView.compareTo(b.numberView));
  }
}
