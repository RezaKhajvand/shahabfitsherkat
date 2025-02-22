part of 'system_bloc.dart';

abstract class SystemState {}

class SystemInitial extends SystemState {}

class SystemLoading extends SystemState {}

class SystemLoaded extends SystemState {
  final List<System> system;

  SystemLoaded({required this.system});
}

class SystemError extends SystemState {
  final String errormsg;

  SystemError({required this.errormsg});
}
