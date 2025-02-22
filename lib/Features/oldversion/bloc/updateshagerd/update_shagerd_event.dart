part of 'update_shagerd_bloc.dart';

class UpdateShagerdEvent {
  final Shagerd shagerd;
  final UpdateAction action;

  UpdateShagerdEvent({required this.shagerd, required this.action});
}

enum UpdateAction { increase, decrease,increaseDirectly,update ,tamdid}
