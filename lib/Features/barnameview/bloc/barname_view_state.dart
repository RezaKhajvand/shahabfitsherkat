part of 'barname_view_bloc.dart';

@immutable
sealed class BarnameViewState {}

final class BarnameViewInitial extends BarnameViewState {}

final class BarnameViewLoading extends BarnameViewState {}

final class BarnameViewLoaded extends BarnameViewState {
  final List<ActivityItem>? basketActivity;
  final Item? daylimeal;
  final String? dayIndex;
  final List<int>? filledDays;

  BarnameViewLoaded({
    this.basketActivity,
    this.dayIndex,
    this.filledDays,
    this.daylimeal,
  });
}

final class BarnameViewError extends BarnameViewState {
  final String errormessage;

  BarnameViewError({required this.errormessage});
}
