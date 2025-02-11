import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahabfit/Features/oldversion/data/updateshagerd_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

final errorProvider = StateProvider<String?>((ref) => null);
final shagerdProvider = AsyncNotifierProvider<ShagerdNotifier, List<Shagerd>>(
    () => ShagerdNotifier());

class ShagerdNotifier extends AsyncNotifier<List<Shagerd>> {
  @override
  Future<List<Shagerd>> build() async {
    try {
      return shagerdFromJson((await getShagerdList()));
    } catch (e) {
      print("$e: ${StackTrace.current}"); // نمایش خطا
      rethrow;
    }
  }

  Future<void> decreaseJalase(Shagerd shagerd) async {
    final errorMessage = ref.read(errorProvider.notifier);
    try {
      if (shagerd.jalase > 0) {
        updateShagerdDatasource(shagerd);
        shagerd.jalase--;
      } else {
        print("جلسه ای برای کم کردن وجود ندارد"); // نمایش خطا
        errorMessage.state = null;
        errorMessage.state = "جلسه ای برای کم کردن وجود ندارد";
      }
      state = AsyncValue.data(state.value!); // نمایش داده ها
    } catch (e) {
      errorMessage.state = e.toString();
      print("$e: ${StackTrace.current}"); // نمایش خطا
    }
  }

 Future<void> refreshShagerds() async {
  state = const AsyncValue.loading(); // نمایش لودینگ قبل از بی‌اعتبار کردن Provider
  ref.invalidate(shagerdProvider);
}
}
