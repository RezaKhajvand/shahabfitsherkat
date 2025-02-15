import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/updateshagerd_datasource.dart';
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
    // ======
    on<DecreaseJalaseEvent>((event, emit) async {
      var shagerd = event.shagerd;
      emit((ShagerdLoading(shagerd: shagerd)));
      try {
        if (shagerd.jalase > 0) {
          emit((ShagerdLoaded(shagerdList: decreaseJalase(shagerd))));
        } else {
          emit(
              (ShagerdUpdateError(message: "جلسه ای برای کم کردن وجود ندارد")));
        }
      } catch (e) {
        emit((ShagerdUpdateError(message: handleException(e))));
      }
    });
    // ======
    on<IncreaseJalaseEvent>((event, emit) async {
      var shagerd = event.shagerd;
      emit((ShagerdLoading(shagerd: shagerd)));
      try {
        if (DateTime.now().difference(shagerd.updated).inHours > 2) {
          emit((ShagerdLoaded(shagerdList: increaseJalase(shagerd))));
        } else {
          HapticFeedback.mediumImpact();
          emit((ShagerdUpdateError(
              message: '''
در ۲ ساعت اخیر کلاس ثبت کرده اید
آیا از افزودن جلسه اطمینان دارید؟
''',
              snackbarAction: SnackBarAction(
                label: 'بله',
                onPressed: () =>
                    emit((ShagerdLoaded(shagerdList: increaseJalase(shagerd)))),
              ))));
        }
      } catch (e) {
        emit((ShagerdUpdateError(message: handleException(e))));
      }
    });
  }

  increaseJalase(Shagerd shagerd) async {
    shagerd.jalase++;
    final updated =
        Shagerd.fromJson(json.decode(await updateShagerdDatasource(shagerd)));
    shagerdList = shagerdList.map((s) {
      return s.id == updated.id ? updated : s;
    }).toList();
    return shagerdList;
  }
  // =======

  decreaseJalase(Shagerd shagerd) async {
    shagerd.jalase--;
    final updated =
        Shagerd.fromJson(json.decode(await updateShagerdDatasource(shagerd)));
    shagerdList = shagerdList.map((s) {
      return s.id == updated.id ? updated : s;
    }).toList();
    return shagerdList;
  }
}
