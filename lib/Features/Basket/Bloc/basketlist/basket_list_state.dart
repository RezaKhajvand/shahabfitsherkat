part of 'basket_list_bloc.dart';

@immutable
sealed class BasketListState {}

final class BasketListInitial extends BasketListState {}

final class BasketListLoading extends BasketListState {}

final class BasketListLoaded extends BasketListState {
  final List<Basket> basketList;

  BasketListLoaded({required this.basketList});
}

final class BasketListError extends BasketListState {
  final String errormsg;

  BasketListError({required this.errormsg});
}
