part of 'barname_view_bloc.dart';

@immutable
sealed class BarnameViewEvent {}

final class FetchBarnameEvent extends BarnameViewEvent {
  final String basketId;
  final String? dayOfWeek;

  FetchBarnameEvent({
    required this.basketId,
    this.dayOfWeek,
  });
}

final class FetchDaylimealEvent extends BarnameViewEvent {
  final String basketId;
  final String? meal;

  FetchDaylimealEvent({
    required this.basketId,
    this.meal,
  });
}

final class DisposeBarnameEvent extends BarnameViewEvent {}

final class FetchActivityEvent extends BarnameViewEvent {
  final String recordId;
  final String basketId;

  FetchActivityEvent({required this.recordId, required this.basketId});
}
