import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/Daylimeal/Data/daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/Data/daylimeal_list_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';

part 'daylimeal_list_event.dart';
part 'daylimeal_list_state.dart';

class DaylimealListBloc extends Bloc<DaylimealListEvent, DaylimealListState> {
  DaylimealListBloc() : super(DaylimealListInitial()) {
    on<DaylimealListEvent>((event, emit) async {
      emit((DaylimealListLoading()));
      try {
        if (event.barnameId == null) {
          final daylimelaList = daylimealListFromJson(await getDaylimealList());
          emit((DaylimealListLoaded(daylimelaList: daylimelaList)));
        } else {
          final daylimeal =
              daylimelFromJson(await getDaylimeal(event.barnameId!));
          emit((DaylimealListLoaded(daylimelaList: [daylimeal])));
        }
      } catch (e, s) {
        emit((DaylimealListError(errormessage: handleException(e, s))));
      }
    });
  }
}
