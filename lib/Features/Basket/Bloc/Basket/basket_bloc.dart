import 'package:bloc/bloc.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/deleteBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Basket/Data/updateBasketActivityDataSource.dart';
import 'package:shahabfit/Features/System/Models/ClubSystemModel.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  late BasketActivity basketActivity;
  BasketBloc() : super(BasketLoading()) {
    on<GetBasketEvent>((event, emit) async {
      emit((BasketLoading()));
      try {
        basketActivity = basketActivityFromJson(
            await getOpenBasketActivity(basketId: event.basketId));

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e) {
        emit((BasketError(errormsg: e.toString())));
      }
    });
    //
    on<DeleteBasketEvent>((event, emit) async {
      emit((BasketLoading()));
      try {
        deleteBasketActivity(basketActivityId: event.basketActivityId);
        basketActivity.items
            .removeWhere((element) => element.id == event.basketActivityId);

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e) {
        emit((BasketError(errormsg: e.toString())));
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
        var updatedRecord = basketActivity.items
            .firstWhere((element) => element.id == event.basketActivityId);
        if (event.systemSubId != null) {
          updatedRecord.system = event.system?.id;
          updatedRecord.systemSubId = event.systemSubId!;
          updatedRecord.expand.system = event.system;
        }
        updatedRecord.activitySet =
            event.activitySet ?? updatedRecord.activitySet;

        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e) {
        emit((BasketError(errormsg: e.toString())));
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

        basketActivity.items
            .firstWhere((element) => element.id == event.firstIndexId)
            .numberView = event.secNumberView;
        basketActivity.items
            .firstWhere((element) => element.id == event.secIndexId)
            .numberView = event.firstNumberView;
        sortItems();
        emit((BasketLoaded(basketActivity: basketActivity)));
      } catch (e) {
        emit((BasketError(errormsg: e.toString())));
      }
    });
  }
  sortItems() {
    basketActivity.items.sort((a, b) => a.numberView.compareTo(b.numberView));
  }
}
