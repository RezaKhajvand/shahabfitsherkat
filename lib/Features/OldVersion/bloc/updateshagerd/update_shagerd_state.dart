part of 'update_shagerd_bloc.dart';

@immutable
sealed class UpdateShagerdState {}

final class UpdateShagerdInitial extends UpdateShagerdState {}

final class UpdateShagerdLoading extends UpdateShagerdState {
  final Shagerd shagerd;

  UpdateShagerdLoading({required this.shagerd});
}

final class UpdateShagerdSuccess extends UpdateShagerdState {
  final Shagerd shagerd;

  UpdateShagerdSuccess({required this.shagerd});
}

final class UpdateShagerdError extends UpdateShagerdState {
  final String message;
  Shagerd? shagerd;

  UpdateShagerdError({
    required this.message,
    this.shagerd,
  });
}
