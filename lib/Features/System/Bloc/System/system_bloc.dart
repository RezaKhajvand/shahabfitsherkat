import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/System/Data/deleteSystemDataSource.dart';
import 'package:shahabfit/Features/System/Data/insertSystemDataSource.dart';
import 'package:shahabfit/Features/System/Data/updateSystemDataSource.dart';
import 'package:shahabfit/Features/System/Models/ClubSystemModel.dart';
import 'package:shahabfit/Features/System/Data/getSystemDataSource.dart';

part 'system_event.dart';
part 'system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState> {
  late ClubSystem system;
  SystemBloc() : super(SystemInitial()) {
    on<GetSystemEvent>((event, emit) async {
      emit((SystemLoading()));
      try {
        system = clubSystemFromJson(await getSystem());
        emit((SystemLoaded(system: system)));
      } catch (e) {
        emit((SystemError(errormsg: e.toString())));
      }
    });
    on<AddSystemEvent>((event, emit) async {
      emit((SystemLoading()));
      try {
        var addedSystem = System.fromJson(json.decode(await insertSystem(
            title: event.title, description: event.description)));
        system.items.add(addedSystem);
        emit((SystemLoaded(system: system)));
      } catch (e) {
        emit((SystemError(errormsg: e.toString())));
      }
    });
    on<UpdateSystemEvent>((event, emit) async {
      emit((SystemLoading()));
      try {
        updateSystem(
            id: event.id, title: event.title, description: event.description);
        var localSystem =
            system.items.firstWhere((element) => element.id == event.id);
        localSystem.title = event.title;
        localSystem.description = event.description;
        emit((SystemLoaded(system: system)));
      } catch (e) {
        emit((SystemError(errormsg: e.toString())));
      }
    });
    on<DeleteSystemEvent>((event, emit) async {
      emit((SystemLoading()));
      try {
        deleteSystem(id: event.id);
        system.items.removeWhere((element) => element.id == event.id);

        emit((SystemLoaded(system: system)));
      } catch (e) {
        emit((SystemError(errormsg: e.toString())));
      }
    });
  }
}
