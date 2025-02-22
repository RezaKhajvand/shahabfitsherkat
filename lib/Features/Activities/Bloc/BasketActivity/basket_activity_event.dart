part of 'basket_activity_bloc.dart';

 abstract class BasketActivityEvent {}
 class InsertBasketActivityEvent extends BasketActivityEvent {
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

class DeleteBasketActivityEvent extends BasketActivityEvent {
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

