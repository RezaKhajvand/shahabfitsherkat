import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/getOpenBasketActivityDataSource.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:video_player/video_player.dart';

part 'barname_view_event.dart';
part 'barname_view_state.dart';

class BarnameViewBloc extends Bloc<BarnameViewEvent, BarnameViewState> {
  List<ActivityItem> basketActivity = [];
  BarnameViewBloc() : super(BarnameViewInitial()) {
    on<FetchBarnameEvent>((event, emit) async {
      emit((BarnameViewLoading()));
      try {
        basketActivity = basketActivityFromJson(
            await getOpenBasketActivity(basketId: event.basketId));
        for (var element in basketActivity) {
          print(element.expand.activity?.video);
          element
              .controller = VideoPlayerController.networkUrl(Uri.parse(element
                  .expand.activity?.video ??
              'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
          await element.controller!.initialize().catchError(onError);
          emit((BarnameViewLoaded(basketActivity: basketActivity)));
        }
        emit((BarnameViewLoaded(basketActivity: basketActivity)));
      } catch (e, s) {
        emit((BarnameViewError(errormessage: handleException(e, s))));
      }
    });
    // ========>
    on<DisposeBarnameEvent>((event, emit) async {
      for (var element in basketActivity) {
        element.controller?.dispose();
        element.controller = null;
      }
    });
  }
}
