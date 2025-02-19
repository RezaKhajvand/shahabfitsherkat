part of 'activity_bloc.dart';

abstract class ActivityEvent {}

class GetActivityEvent extends ActivityEvent {
  final String categoryId;
  final int dayOfWeek;
  final String? searchValue;
  final String? openBasketId;

  GetActivityEvent(
      {required this.categoryId,
      required this.dayOfWeek,
      this.searchValue,
      this.openBasketId});
}

class InsertActivityEvent extends ActivityEvent {
  final String categoryId;
  final int dayOfWeek;
  final String title;

  InsertActivityEvent(
      {required this.categoryId, required this.title, required this.dayOfWeek});
}

class UpdateActivityEvent extends ActivityEvent {
 final List<ActivityRecord> activityList;

  UpdateActivityEvent({required this.activityList});

}

class DeleteActivityEvent extends ActivityEvent {
  final ActivityRecord activity;

  DeleteActivityEvent({required this.activity});
}

class InsertBasketActivityEvent extends ActivityEvent {
  final String categoryId;
  final String activityId;
  final String title;
  final bool isInBasket;
  final int dayOfWeek;
  final List<List<int>> activitySet;

  InsertBasketActivityEvent(
      {required this.categoryId,
      required this.activityId,
      required this.title,
      required this.isInBasket,
      required this.dayOfWeek,
      required this.activitySet});
}

class DeleteBasketActivityEvent extends ActivityEvent {
  final String basketActivityId;
  final String categoryId;
  final String activityId;
  final String title;
  final bool isInBasket;

  DeleteBasketActivityEvent(
      {required this.basketActivityId,
      required this.categoryId,
      required this.activityId,
      required this.title,
      required this.isInBasket});
}
