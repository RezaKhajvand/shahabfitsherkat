import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/login/data/login_datasource.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/url.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit((LoginLoading()));
      try {
        await login(phone: event.phone, password: event.password);
        print(pb.authStore.isValid);
        await AuthManager.saveAccessToken(pb.authStore.token);
        emit((LoginSuccess()));
      } catch (e, s) {
        emit((LoginError(errormessage: handleException(e, s))));
      }
    });
  }
}
