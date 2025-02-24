part of 'barname_view_bloc.dart';

@immutable
sealed class BarnameViewEvent {}

final class FetchBarnameEvent extends BarnameViewEvent {
  final String basketId;

  FetchBarnameEvent({required this.basketId});
}

final class DisposeBarnameEvent extends BarnameViewEvent {}
