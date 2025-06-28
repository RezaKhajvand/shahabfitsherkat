import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/login/bloc/login_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/Widgets/customlinearloading.dart';
import 'package:shahabfit/constants/values.dart';
import 'package:shahabfit/firebase_options.dart';
import 'package:shahabfit/utils/texttheme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _visibility = false;

  loginTap() {
    BlocProvider.of<LoginBloc>(context).add(LoginEvent(
        phone: replaceEnglishNumber(userController.text),
        password: passController.text,
        type: LoginType.userPass));
  }

  fingerLoginTap() {
    BlocProvider.of<LoginBloc>(context)
        .add(LoginEvent(phone: "", password: "", type: LoginType.finger));
  }

  initFirebase() async {
    try {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      final notificationSettings =
          await FirebaseMessaging.instance.requestPermission(provisional: true);
      print(notificationSettings);
      final fcmToken = await FirebaseMessaging.instance.getToken(
          vapidKey:
              "BJQUpS7dh779bMiGKbdRn7imKkfLH8dHlzTXkk-T39Qev1PXwft3KBtr2V41fM-uDFYXmRt5mSMyocedGH-MQdw");
      print(fcmToken);
      getSuccessSnackbar(context, fcmToken ?? 'Failed');
    } catch (e) {
      print(e);
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // initFirebase();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            getSuccessSnackbar(context, 'ورود موفق');
            context.pushReplacement(splashPage);
          }
          if (state is LoginError) {
            getErrorSnackbar(context, state.errormessage);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: Image.asset(
                      'images/render-min.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('به  ', style: context.anjomanMedium),
                    Text('برمودا  ',
                        style: context.anjomanBlack.copyWith(color: primary)),
                    Text('خوش اومدی', style: context.anjomanMedium),
                  ],
                ),
                SizedBox(height: 8),
                Text('''این مثلث برمودا تا فیتت نکنه ول نمیکنه!''',
                    style: context.anjomanExtraLight
                        .copyWith(color: Colors.white54)),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: AutofillGroup(
                    child: Column(
                      children: [
                        TextFormField(
                          autofillHints: [AutofillHints.username],
                          controller: userController,
                          inputFormatters: [FarsiInputFormatter()],
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.phone,
                                color: primary,
                                size: 20,
                              ),
                              enabledBorder: inputBorder(),
                              filled: true,
                              label: Text('شماره همراه'),
                              fillColor: Colors.black45),
                        ),
                        SizedBox(height: 14),
                        TextFormField(
                          autofillHints: [AutofillHints.password],
                          controller: passController,
                          obscureText: !_visibility,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() => _visibility = !_visibility),
                              icon: Icon(
                                _visibility
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: primary,
                                size: 20,
                              ),
                            ),
                            enabledBorder: inputBorder(),
                            filled: true,
                            label: Text('رمز عبور'),
                            fillColor: Colors.black45,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: AnimatedContainer(
                              height: state is LoginLoading
                                  ? animatedButtonHeight
                                  : fixButtonHeight,
                              width: double.infinity,
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 300),
                              child: state is LoginLoading
                                  ? CustomLinearLoading()
                                  : ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          loginTap();
                                        }
                                      },
                                      child: Text('ورود'))),
                        ),
                        SizedBox(height: 80),
                        IconButton(
                            onPressed: () => fingerLoginTap(),
                            icon: Icon(
                              Icons.fingerprint,
                              size: 60,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(borderSide: BorderSide(color: Colors.white24));
  }
}
