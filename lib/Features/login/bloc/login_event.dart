part of 'login_bloc.dart';

class LoginEvent {
  final String phone;
  final String password;
  final LoginType type;

  LoginEvent({
    required this.phone,
    required this.password,
    required this.type,
  });
}

enum LoginType { finger, userPass }
