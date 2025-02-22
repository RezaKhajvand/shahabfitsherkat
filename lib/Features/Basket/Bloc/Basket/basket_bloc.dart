import 'package:bloc/bloc.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/deleteBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/updateBasketActivityDataSource.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  late List<ActivityItem> basketActivity;
  BasketBloc() : super(BasketLoading()) {
    on<GetBasketEvent>((event, emit) async {
      emit((BasketLoading()));
      try {
        basketActivity = basketActivityFromJson(
            await getOpenBasketActivity(basketId: event.basketId));

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e, s) {
        emit((BasketError(errormsg: handleException(e, s))));
      }
    });
    //
    on<DeleteBasketEvent>((event, emit) async {
      emit((BasketLoading()));
      try {
        deleteBasketActivity(basketActivityId: event.basketActivityId);
        basketActivity
            .removeWhere((element) => element.id == event.basketActivityId);

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e, s) {
        emit((BasketError(errormsg: handleException(e, s))));
      }
    });
    //
    on<UpdateBasketActivityEvent>((event, emit) async {
      emit((BasketLoading()));
      try {
        updateBasketActivity(
          basketActivityId: event.basketActivityId,
          system: event.system?.id,
          systemSubId: event.systemSubId,
          activitySet: event.activitySet,
        );
        var updatedRecord = basketActivity
            .firstWhere((element) => element.id == event.basketActivityId);
        if (event.systemSubId != null) {
          updatedRecord.system = event.system?.id;
          updatedRecord.systemSubId = event.systemSubId!;
          updatedRecord.expand.system = event.system;
        }
        updatedRecord.activitySet =
            event.activitySet ?? updatedRecord.activitySet;

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e, s) {
        emit((BasketError(errormsg: handleException(e, s))));
      }
    });
    //
    on<ChangeNumberViewEvent>((event, emit) async {
      try {
        updateBasketActivity(
            basketActivityId: event.firstIndexId,
            numberView: event.secNumberView);
        updateBasketActivity(
            basketActivityId: event.secIndexId,
            numberView: event.firstNumberView);

        basketActivity
            .firstWhere((element) => element.id == event.firstIndexId)
            .numberView = event.secNumberView;
        basketActivity
            .firstWhere((element) => element.id == event.secIndexId)
            .numberView = event.firstNumberView;
        sortItems();
        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e, s) {
        emit((BasketError(errormsg: handleException(e, s))));
      }
    });
  }
  sortItems() {
    basketActivity.sort((a, b) => a.numberView.compareTo(b.numberView));
  }
}
