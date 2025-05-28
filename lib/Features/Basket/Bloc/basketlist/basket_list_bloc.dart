import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/Basket/Models/OpenBasketModel.dart';
import 'package:shahabfit/Features/BasketList/Data/getBasketDataSource.dart';
import 'package:shahabfit/Features/BasketList/Data/getBasketListDataSource.dart';
import 'package:shahabfit/Features/oldversion/utils/handleexception.dart';

part 'basket_list_event.dart';
part 'basket_list_state.dart';

class BasketListBloc extends Bloc<BasketListEvent, BasketListState> {
  BasketListBloc() : super(BasketListInitial()) {
    on<GetBasketList>((event, emit) async {
      emit((BasketListLoading()));
      List<Basket> basketList = [];
      try {
        if (event.basketId == null) {
          basketList = basketListFromJson(await getBasketList());
        } else {
          basketList = [basketFromJson(await getBasket(event.basketId!))];
        }
        emit((BasketListLoaded(basketList: basketList)));
      } catch (e, s) {
        emit((BasketListError(errormsg: handleException(e, s))));
      }
    });
  }
}
