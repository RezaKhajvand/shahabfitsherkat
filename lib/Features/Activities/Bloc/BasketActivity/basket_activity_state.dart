part of 'basket_activity_bloc.dart';

abstract class BasketActivityState {}

class BasketActivityInitial extends BasketActivityState {}

class BasketActivityLoading extends BasketActivityState {}

class BasketActivityLoaded extends BasketActivityState {}

class BasketActivityError extends BasketActivityState {
  final String errormsg;

  BasketActivityError({required this.errormsg});
}
