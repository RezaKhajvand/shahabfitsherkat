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

final class DisposeBarnameEvent extends BarnameViewEvent {}

final class FetchActivityEvent extends BarnameViewEvent {
  final String recordId;

  FetchActivityEvent({required this.recordId});
}
