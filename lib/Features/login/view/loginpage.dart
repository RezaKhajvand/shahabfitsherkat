import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/constants/router.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: BlocBuilder<BasketBloc, BasketState>(
        builder: (context, state) {
          return Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(
                        'images/render-min.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text('به شهاب فیت خوش آمدید', style: context.anjomanBlack),
                  SizedBox(height: 10),
                  Text('''اینجا فیت شو و فیت بمون
برنامه هاتو مدیریت کن و به چیزایی که میخوای برس
                      ''',
                      style: context.anjomanExtraLight
                          .copyWith(color: Colors.white54)),
                  TextFormField(
                    controller: userController,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                        enabledBorder: inputBorder(),
                        filled: true,
                        label: Text('نام کاربری'),
                        fillColor: Colors.black45),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passController,
                    textDirection: TextDirection.ltr,
                    decoration: InputDecoration(
                        enabledBorder: inputBorder(),
                        filled: true,
                        label: Text('رمز عبور'),
                        fillColor: Colors.black45),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (userController.text == 'rezar' &&
                                  passController.text == '@Ss123456') {
                                final share =
                                    await SharedPreferences.getInstance();
                                await share.setString("user", "rezar");
                                context.go(splashPage);
                              }
                            },
                            child: Text('ورود'))),
                  )
                ],
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
