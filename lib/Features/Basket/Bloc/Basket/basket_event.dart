part of 'basket_bloc.dart';

abstract class BasketEvent {}

class GetBasketEvent extends BasketEvent {
  final String basketId;

  GetBasketEvent({required this.basketId});
}

class DeleteBasketEvent extends BasketEvent {
  final String basketActivityId;

  DeleteBasketEvent({required this.basketActivityId});
}

class UpdateBasketActivityEvent extends BasketEvent {
  final String basketActivityId;
  final List<List<int>>? activitySet;
  final System? system;
  final int? systemSubId;

  UpdateBasketActivityEvent({
    this.activitySet,
    this.system,
    this.systemSubId,
    required this.basketActivityId,
  });
}

class ChangeNumberViewEvent extends BasketEvent {
  final String firstIndexId;
  final String secIndexId;
  final int firstNumberView;
  final int secNumberView;

  ChangeNumberViewEvent(
      {required this.firstIndexId,
      required this.secIndexId,
      required this.firstNumberView,
      required this.secNumberView});
}
