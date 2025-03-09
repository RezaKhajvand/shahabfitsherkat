import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/login/bloc/login_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
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
    ));
  }

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
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: AutofillGroup(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                        Text('شهاب فیت  ',
                            style:
                                context.anjomanBlack.copyWith(color: primary)),
                        Text('خوش آمدید', style: context.anjomanMedium),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                        '''اینجا فیت شو و فیت بمون\nبرنامه هاتو مدیریت کن و به چیزایی که میخوای برس
''',
                        style: context.anjomanExtraLight
                            .copyWith(color: Colors.white54)),
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
                    SizedBox(height: 20),
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
                          height: state is LoginLoading ? 4 : 45,
                          width: double.infinity,
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 300),
                          child: state is LoginLoading
                              ? LinearProgressIndicator(
                                  backgroundColor:
                                      primary.withValues(alpha: 0.2),
                                  color: primary,
                                )
                              : ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      loginTap();
                                    }
                                  },
                                  child: Text('ورود'))),
                    )
                  ],
                ),
              ),
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
