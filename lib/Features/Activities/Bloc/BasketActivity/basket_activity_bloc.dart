// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:meta/meta.dart';
// import 'package:shahabfit/Features/Activities/Data/ActivityCollection/updateActivityDataSource.dart';
// import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/deleteBasketActivityDataSource.dart';
// import 'package:shahabfit/Features/Activities/Data/BasketActivityCollection/insertBasketActivityDataSource.dart';
// import 'package:shahabfit/Features/Activities/Models/ActivityModel.dart';
// import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
// import 'package:shahabfit/Features/Activities/Models/InsertBasketActivityModel.dart';

// part 'basket_activity_event.dart';
// part 'basket_activity_state.dart';

// class BasketActivityBloc extends Bloc<BasketActivityEvent, BasketActivityState> {
//   BasketActivityBloc() : super(BasketActivityInitial()) {
//     on<InsertBasketActivityEvent>((event, emit) async {
//       try {
//         var insertedBasketActivity = insertBasketActivityFromJson(
//             await insertBasketActivity(
//                 basket: openBasketId,
//                 dayOfWeek: event.dayOfWeek,
//                 activity: event.activityId,
//                 activitySet: event.activitySet));

//         updateActivity(
//             activityId: event.activityId,
//             title: event.title,
//             catId: event.categoryId,
//             isInBasket: event.isInBasket);
//         final ActivityRecord updatedActivity = activity.items
//             .firstWhere((element) => element.id == event.activityId);
//         updatedActivity.catId = event.categoryId;
//         updatedActivity.isInBasket = event.isInBasket;
//         updatedActivity.title = event.title;
//         //
//         openBasket.items.add(ActivityItem(
//             activity: event.activityId,
//             activitySet: event.activitySet,
//             basket: openBasketId,
//             dayOfWeek: event.dayOfWeek,
//             collectionId: insertedBasketActivity.collectionId,
//             collectionName: insertedBasketActivity.collectionName,
//             created: insertedBasketActivity.created,
//             updated: insertedBasketActivity.updated,
//             system: insertedBasketActivity.system,
//             systemSubId: insertedBasketActivity.systemSubId,
//             id: insertedBasketActivity.id,
//             expand: Expand()));
//         emit((ActivityLoaded(
//             openBasket: openBasket,
//             activity: activity,
//             openBasketId: openBasketId)));
//       } on DioException catch (e,s) {
//         emit((BasketActivityError(
//             errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
//       } catch (e,s) {
//         emit((BasketActivityError(errormsg: e.toString())));
//       }
//     });
//     on<DeleteBasketActivityEvent>((event, emit) async {
//       try {
//         deleteBasketActivity(basketActivityId: event.basketActivityId);
//         updateActivity(
//             activityId: event.activityId,
//             title: event.title,
//             catId: event.categoryId,
//             isInBasket: event.isInBasket);
//         final ActivityRecord updatedActivity = activity.items
//             .firstWhere((element) => element.id == event.activityId);
//         updatedActivity.catId = event.categoryId;
//         updatedActivity.isInBasket = event.isInBasket;
//         updatedActivity.title = event.title;
//         openBasket.items
//             .removeWhere((element) => element.id == event.basketActivityId);
//         emit((ActivityLoaded(
//             openBasket: openBasket,
//             activity: activity,
//             openBasketId: openBasketId)));
//       } on DioException catch (e,s) {
//         emit((BasketActivityError(
//             errormsg: e.response?.data?['message'] ?? 'مشکلی پیش آمده است')));
//       } catch (e,s) {
//         emit((BasketActivityError(errormsg: e.toString())));
//       }
//     });

//   }
// }
