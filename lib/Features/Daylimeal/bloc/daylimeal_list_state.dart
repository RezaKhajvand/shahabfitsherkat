part of 'daylimeal_list_bloc.dart';

@immutable
sealed class DaylimealListState {}

final class DaylimealListInitial extends DaylimealListState {}

final class DaylimealListLoading extends DaylimealListState {}

final class DaylimealListLoaded extends DaylimealListState {
  final List<Item> daylimelaList;

  DaylimealListLoaded({required this.daylimelaList});
}

final class DaylimealListError extends DaylimealListState {
  final String errormessage;

  DaylimealListError({required this.errormessage});
}
