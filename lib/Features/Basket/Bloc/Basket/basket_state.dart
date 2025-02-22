part of 'basket_bloc.dart';

class BasketState {}

class BasketLoading extends BasketState {}

class BasketLoaded extends BasketState {
  final List<ActivityItem>   basketActivity;

  BasketLoaded({required this.basketActivity});
}

class BasketError extends BasketState {
  final String errormsg;
  BasketError({required this.errormsg});
}
