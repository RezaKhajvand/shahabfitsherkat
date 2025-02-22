import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
        image: DecorationImage(
          image: AssetImage('images/shahabbg.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              title: Image.asset('images/logotype.png', height: 16)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () => context.push(managePage),
                  child: Image.asset(
                    'images/manage.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () => context.push(activitiesPage),
                  child: Image.asset(
                    'images/gym.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () => context.push(trainerPage),
                  child: Image.asset(
                    'images/food.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 14),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    getErrorSnackbar(context, 'به زودی');
                  },
                  child: Image.asset(
                    'images/fitnes.png',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
