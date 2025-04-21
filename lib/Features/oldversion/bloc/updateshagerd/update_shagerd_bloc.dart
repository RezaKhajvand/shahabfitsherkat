import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/oldversion/data/createjalase_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/deletealljalasat_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/deletejalase_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/updateshagerd_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';
import 'package:shahabfit/Features/oldversion/utils/handleexception.dart';

part 'update_shagerd_event.dart';
part 'update_shagerd_state.dart';

class UpdateShagerdBloc extends Bloc<UpdateShagerdEvent, UpdateShagerdState> {
  UpdateShagerdBloc() : super(UpdateShagerdInitial()) {
    on<UpdateShagerdEvent>((event, emit) async {
      var shagerd = event.shagerd;
      emit((UpdateShagerdLoading(shagerd: shagerd)));
      try {
        switch (event.action) {
          case UpdateAction.decrease:
            {
              if (shagerd.jalase > 0) {
                emit((UpdateShagerdSuccess(
                    shagerd: await decreaseJalase(shagerd))));
              } else {
                emit((UpdateShagerdError(
                    message: "جلسه ای برای کم کردن وجود ندارد")));
              }
            }
            break;
          case UpdateAction.increase:
            {
              if (DateTime.now().difference(shagerd.updated!).inHours > 2) {
                emit((UpdateShagerdSuccess(
                    shagerd: await increaseJalase(shagerd))));
              } else {
                HapticFeedback.mediumImpact();
                emit((UpdateShagerdError(message: '''
در ۲ ساعت اخیر کلاس ثبت کرده اید
آیا از افزودن جلسه اطمینان دارید؟
''', shagerd: shagerd)));
              }
            }
            break;
          case UpdateAction.increaseDirectly:
            {
              emit((UpdateShagerdSuccess(
                  shagerd: await increaseJalase(shagerd))));
            }
            break;
          case UpdateAction.update:
            {
              emit((UpdateShagerdSuccess(shagerd: await update(shagerd))));
            }
          case UpdateAction.tamdid:
            {
              emit((UpdateShagerdSuccess(shagerd: await tamdid(shagerd))));
            }
        }
      } catch (e, s) {
        emit((UpdateShagerdError(message: handleException(e, s))));
      }
    });
  }

  Future<Shagerd> update(Shagerd shagerd) async {
    var updatingShagerd = shagerd;
    final resault = await updateShagerdDatasource(updatingShagerd);
    shagerd = Shagerd.fromJson(json.decode(resault));
    return shagerd;
  }

  // =======
  Future<Shagerd> increaseJalase(Shagerd shagerd) async {
    var updatingShagerd = shagerd.copyWith(jalase: ++shagerd.jalase);
    createJalaseDatasource(shagerd);
    return updatingShagerd;
  }

  // =======
  Future<Shagerd> decreaseJalase(Shagerd shagerd) async {
    var updatingShagerd = shagerd.copyWith(jalase: --shagerd.jalase);
    deleteLastJalaseDatasource(shagerd);
    return updatingShagerd;
  }

  // =======
  Future<Shagerd> tamdid(Shagerd shagerd) async {
    final responses = await Future.wait([
      deleteShagerdAllJalasatDatasource(shagerd),
      updateShagerdDatasource(shagerd)
    ]);
    final resault = responses.last as String;
    shagerd = Shagerd.fromJson(json.decode(resault));
    return shagerd;
  }
}
