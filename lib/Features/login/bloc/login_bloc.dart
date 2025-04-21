import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/login/data/fingerprint.dart';
import 'package:shahabfit/Features/login/data/login_datasource.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit((LoginLoading()));
      try {
        switch (event.type) {
          case LoginType.userPass:
            {
              await login(phone: event.phone, password: event.password);
            }
            break;
          case LoginType.finger:
            {
              await loginWithFingerprint();
            }
        }
        await AuthManager.saveAuth(pb.authStore);
        emit((LoginSuccess()));
      } catch (e, s) {
        emit((LoginError(errormessage: handleException(e, s))));
      }
    });
  }
}
