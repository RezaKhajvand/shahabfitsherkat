import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:meta/meta.dart';
import 'package:shahabfit/Features/login/data/fingerprint.dart';
import 'package:shahabfit/Features/login/data/login_datasource.dart';
import 'package:shahabfit/Features/oldversion/utils/handleException.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/constants/pb.dart';
import 'package:shahabfit/constants/values.dart';
import 'package:shahabfit/firebase_options.dart';

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
              final auth = await loginWithFingerprint();
              pb.authStore.save(auth.token, auth.record);
            }
        }

        await AuthManager.saveAuth(pb.authStore);
        initFirebase();
        emit((LoginSuccess()));
      } catch (e, s) {
        emit((LoginError(errormessage: handleException(e, s))));
      }
    });
  }
}

initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.instance.requestPermission(provisional: true);
  final fcmToken =
      await FirebaseMessaging.instance.getToken(vapidKey: vapidKey);
  print(fcmToken);
  final body = {"fcmToken": fcmToken};
  await pb.collection('users').update(pb.authStore.record!.id, body: body);
}
