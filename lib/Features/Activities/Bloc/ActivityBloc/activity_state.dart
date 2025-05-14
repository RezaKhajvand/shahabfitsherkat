part of 'activity_bloc.dart';

abstract class ActivityState {}

final class ActivityLoading extends ActivityState {}

final class ActivityLoaded extends ActivityState {
  final  List<ActivityRecord> activity;
  final List<ActivityItem> openBasket;
 
  final String? loadingItem;

  ActivityLoaded({

    required this.activity,
    required this.openBasket,
    this.loadingItem,
  });
}

final class ActivityError extends ActivityState {
  final String errormsg;

  ActivityError({this.errormsg = 'خطا در دریافت اطلاعات'});
}
