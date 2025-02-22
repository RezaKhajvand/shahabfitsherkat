part of 'shagerd_bloc.dart';

@immutable
sealed class ShagerdState {}

final class ShagerdInitial extends ShagerdState {}

final class ShagerdLoading extends ShagerdState {}

final class ShagerdError extends ShagerdState {
  final String message;

  ShagerdError({required this.message});
}

final class ShagerdLoaded extends ShagerdState {
  final List<Shagerd> shagerdList;

  ShagerdLoaded({required this.shagerdList});
}
