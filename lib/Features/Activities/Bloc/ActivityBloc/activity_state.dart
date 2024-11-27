part of 'activity_bloc.dart';

abstract class ActivityState {}

final class ActivityLoading extends ActivityState {}

final class ActivityLoaded extends ActivityState {
  final ActivityList activity;
  final BasketActivity openBasket;
  final String openBasketId;
  final String? loadingItem;

  ActivityLoaded({
    required this.openBasketId,
    required this.activity,
    required this.openBasket,
    this.loadingItem,
  });
}

final class ActivityError extends ActivityState {
  final String errormsg;

  ActivityError({this.errormsg = 'خطا در دریافت اطلاعات'});
}
