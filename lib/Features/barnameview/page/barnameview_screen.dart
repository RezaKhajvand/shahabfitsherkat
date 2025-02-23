import 'package:flutter/material.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/texttheme.dart';

class BarnameViewPage extends StatefulWidget {
  const BarnameViewPage({super.key});

  @override
  State<BarnameViewPage> createState() => _BarnameViewPageState();
}

class _BarnameViewPageState extends State<BarnameViewPage> {
  int _selectedDay = 0;
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
        body: Row(children: [
          Column(
            children: List.generate(
              6,
              (index) => Expanded(
                  child: Material(
                color: _selectedDay == index ? primary : background,
                child: InkWell(
                  onTap: () => setState(() => _selectedDay = index),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border:
                            Border(bottom: BorderSide(color: Colors.white30))),
                    alignment: Alignment.center,
                    width: 100,
                    child: Text(
                      'جلسه ${replaceFarsiNumber('${index + 1}')}',
                      style: context.anjomanLight.copyWith(
                        color:
                            _selectedDay != index ? Colors.white : background,
                      ),
                    ),
                  ),
                ),
              )),
            ),
          ),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://club.liara.run/api/files/4douingln4kho3q/uid5wez20tbxf8m/number_8_Ty7cuiVl3n.png?thumb=200x200',
                          fit: BoxFit.cover,
                          height: 140,
                          width: double.infinity,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'اسکات اسمیت',
                          style: context.anjomanExtraBold,
                        ),
                        SizedBox(height: 4),
                        Text(
                          '۴-۸-۱۲-۱۶',
                          style: context.anjomanMedium,
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 6,
                    ),
                itemCount: 10),
          )
        ]),
      ),
    );
  }
}
