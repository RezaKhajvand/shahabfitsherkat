import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/Daylimeal/Data/daylimeal_list_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';

part 'daylimeal_list_event.dart';
part 'daylimeal_list_state.dart';

class DaylimealListBloc extends Bloc<DaylimealListEvent, DaylimealListState> {
  DaylimealListBloc() : super(DaylimealListInitial()) {
    on<DaylimealListEvent>((event, emit) async {
      emit((DaylimealListLoading()));
      try {
        final daylimelaList = daylimealListFromJson(await getDaylimealList());
        emit((DaylimealListLoaded(daylimelaList: daylimelaList)));
      } catch (e) {
        emit((DaylimealListError(errormessage: e.toString())));
      }
    });
  }
}
