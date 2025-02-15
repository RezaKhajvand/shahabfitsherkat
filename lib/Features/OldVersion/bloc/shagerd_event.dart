part of 'shagerd_bloc.dart';

@immutable
sealed class ShagerdEvent {}

final class FetchShagerdEvent extends ShagerdEvent {}

final class DecreaseJalaseEvent extends ShagerdEvent {
  final Shagerd shagerd;

  DecreaseJalaseEvent({required this.shagerd});
}

final class IncreaseJalaseEvent extends ShagerdEvent {
  final Shagerd shagerd;

  IncreaseJalaseEvent({required this.shagerd});
}
