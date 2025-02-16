import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/Features/oldversion/utils/handleexception.dart';

part 'shagerd_event.dart';
part 'shagerd_state.dart';

class ShagerdBloc extends Bloc<ShagerdEvent, ShagerdState> {
  List<Shagerd> shagerdList = [];
  ShagerdBloc() : super(ShagerdInitial()) {
    on<FetchShagerdEvent>((event, emit) async {
      emit((ShagerdLoading()));
      try {
        shagerdList = shagerdFromJson(await getShagerdList());
        emit((ShagerdLoaded(shagerdList: shagerdList)));
      } catch (e) {
        emit((ShagerdError(message: handleException(e))));
      }
    });
  }
}
