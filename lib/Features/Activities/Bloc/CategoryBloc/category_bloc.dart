// import 'package:bloc/bloc.dart';

// import 'package:shahabfit/Features/Activities/Data/CategoryCollection/getCategoryDataSource.dart';
// import 'package:shahabfit/Features/Activities/Models/CategoryModel.dart';

// part 'category_event.dart';
// part 'category_state.dart';

// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   CategoryBloc() : super(CategoryInitial()) {
//     on<GetCategoryEvent>((event, emit) async {
//       emit((CategoryLoading()));
//       try {
//         final category = bodyCategoryFromJson(await getCategory());
//         emit((CategoryLoaded(category: category)));
//       } catch (e,s) {
//         emit((CategoryError(errormsg: e.toString())));
//       }
//     });
//   }
// }
