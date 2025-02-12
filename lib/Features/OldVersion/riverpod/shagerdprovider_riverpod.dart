import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shahabfit/Features/oldversion/data/updateshagerd_datasource.dart';
import 'package:shahabfit/Features/oldversion/data/shagerdlist_datasource.dart';
import 'package:shahabfit/Features/oldversion/models/shagerd_model.dart';

class SnackbarError {
  final String errorMessage;
  final SnackBarAction? action;

  SnackbarError({
    required this.errorMessage,
    this.action,
  });
}

final errorProvider = StateProvider<SnackbarError?>((ref) => null);
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
    final errorprovider = ref.read(errorProvider.notifier);
    try {
      if (shagerd.jalase > 0) {
        shagerd.jalase--;
        updateShagerdDatasource(shagerd);
      } else {
        print("جلسه ای برای کم کردن وجود ندارد"); // نمایش خطا
        setErrorMessage(errorprovider,
            SnackbarError(errorMessage: "جلسه ای برای کم کردن وجود ندارد"));
      }
      state = AsyncValue.data(state.value!); // نمایش داده ها
    } catch (e) {
      setErrorMessage(errorprovider, SnackbarError(errorMessage: e.toString()));
      print("$e: ${StackTrace.current}"); // نمایش خطا
    }
  }

  // ==================
  Future<void> increaseJalase(Shagerd shagerd) async {
    final errorprovider = ref.read(errorProvider.notifier);
    try {
      if (DateTime.now().difference(shagerd.updated).inHours > 2) {
        shagerd.jalase++;
        updateShagerdDatasource(shagerd);
        state = AsyncValue.data(state.value!); // نمایش داده ها
      } else {
        HapticFeedback.mediumImpact();
        setErrorMessage(
            errorprovider,
            SnackbarError(
                errorMessage: '''
در ۲ ساعت اخیر کلاس ثبت کرده اید
آیا از افزودن جلسه اطمینان دارید؟
''',
                action: SnackBarAction(
                  label: 'بله',
                  onPressed: () {
                    shagerd.jalase++;
                    updateShagerdDatasource(shagerd);
                    state = AsyncValue.data(state.value!); // نمایش داده ها
                  },
                )));
      }
    } catch (e) {
      setErrorMessage(errorprovider, SnackbarError(errorMessage: e.toString()));
      print("$e: ${StackTrace.current}"); // نمایش خطا
    }
  }

  Future<void> refreshShagerds() async {
    state = const AsyncValue
        .loading(); // نمایش لودینگ قبل از بی‌اعتبار کردن Provider
    ref.invalidateSelf(); // بی‌اعتبارسازی خود Notifier
  }
}

setErrorMessage(StateController<SnackbarError?> errorprovider, messeage) {
  errorprovider.state = null;
  errorprovider.state = messeage;
}
