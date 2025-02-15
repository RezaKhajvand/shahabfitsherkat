part of 'shagerd_bloc.dart';

@immutable
sealed class ShagerdState {}

final class ShagerdInitial extends ShagerdState {}

final class ShagerdLoading extends ShagerdState {
  final Shagerd? shagerd;

  ShagerdLoading({this.shagerd});
}

final class ShagerdError extends ShagerdState {
  final String message;

  ShagerdError({required this.message});
}

final class ShagerdLoaded extends ShagerdState {
  final List<Shagerd> shagerdList;

  ShagerdLoaded({required this.shagerdList});
}

class ShagerdUpdateError extends ShagerdState {
  SnackBarAction? snackbarAction;
  final String message;

  ShagerdUpdateError({ this.snackbarAction, required this.message});
}
