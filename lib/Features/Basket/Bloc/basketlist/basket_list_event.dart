part of 'basket_list_bloc.dart';

@immutable
sealed class BasketListEvent {}

class GetBasketList extends BasketListEvent {
  final String? basketId;

  GetBasketList({ this.basketId});
}
