import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Daylimeal/Data/daylimeal_datasource.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/barnameview/utils/setvideoplayercontroller.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';

part 'barname_view_event.dart';
part 'barname_view_state.dart';

class BarnameViewBloc extends Bloc<BarnameViewEvent, BarnameViewState> {
  List<ActivityItem> basketActivity = [];

  @override
  Future<void> close() {
    for (var element in basketActivity) {
      element.videoController?.dispose();
      element.videoController = null;
    }
    print("Bloc is closing...");
    return super.close();
  }

  BarnameViewBloc() : super(BarnameViewInitial()) {
    print("Bloc is starting...");
    on<FetchActivityEvent>((event, emit) async {
      emit((BarnameViewLoading()));
      try {
        basketActivity = basketActivityFromJson(await getOpenBasketActivity(
          recordId: event.recordId,
          basketId: event.basketId,
        ));
        for (var element in basketActivity) {
          element.videoController = setVideoPlayerController(element);
          await element.videoController!.initialize().catchError(onError);
        }
        emit((BarnameViewLoaded(
          basketActivity: basketActivity,
        )));
      } catch (e, s) {
        emit((BarnameViewError(errormessage: handleException(e, s))));
      }
    });
    // ========>
    on<FetchBarnameEvent>((event, emit) async {
      final dayIndex = event.dayOfWeek ?? '0';
      emit((BarnameViewLoading()));
      try {
        basketActivity = basketActivityFromJson(
            await getOpenBasketActivity(basketId: event.basketId));
        List<int> filledDays = [];
        for (var element in basketActivity) {
          filledDays.add(element.dayOfWeek);
        }
        filledDays.sort();
        filledDays = {...filledDays}.toList();
        basketActivity = basketActivity
            .where(
              (element) => element.dayOfWeek.toString() == dayIndex,
            )
            .toList();
        emit((BarnameViewLoaded(
            basketActivity: basketActivity,
            dayIndex: dayIndex,
            filledDays: filledDays)));
      } catch (e, s) {
        emit((BarnameViewError(errormessage: handleException(e, s))));
      }
    });
    on<FetchDaylimealEvent>((event, emit) async {
      emit((BarnameViewLoading()));
      try {
        final daylimeal = daylimelFromJson(await getDaylimeal(event.basketId));
      
        emit((BarnameViewLoaded(daylimeal:daylimeal)));
      } catch (e, s) {
        emit((BarnameViewError(errormessage: handleException(e, s))));
      }
    });
  }
}
