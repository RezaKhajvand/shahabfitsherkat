part of 'system_bloc.dart';

abstract class SystemEvent {}

class GetSystemEvent extends SystemEvent {}

class AddSystemEvent extends SystemEvent {
  final String title;
  final String description;

  AddSystemEvent({required this.title, required this.description});
}

class UpdateSystemEvent extends SystemEvent {
  final String id;
  final String title;
  final String description;

  UpdateSystemEvent(
      {required this.id, required this.title, required this.description});
}

class DeleteSystemEvent extends SystemEvent {
  final String id;

  DeleteSystemEvent({required this.id});
}
