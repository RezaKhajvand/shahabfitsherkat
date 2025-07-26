import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Features/barnameview/utils/updateurl.dart';
import 'package:shahabfit/Features/oldversion/utils/formatdatetime.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/authmanager.dart';
import 'package:shahabfit/Utils/daylipdfcreator.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shimmer/shimmer.dart';

class DaylimealViewPage extends StatefulWidget {
  final String basketId;

  const DaylimealViewPage({super.key, required this.basketId});

  @override
  State<DaylimealViewPage> createState() => _DaylimealViewPageState();
}

class _DaylimealViewPageState extends State<DaylimealViewPage> {
  List<Daylimeal> pdfMeals = [];
  final mealsicon =
      '🍎🍐🍊🍋🍋‍🟩🍌🍉🍇🍓🫐🍈🍒🍑🥭🍍🥥🥝🍅🍆🥑🥦🫛🥬🫜🥒🌶🫑🌽🥕🫒🧄🧅🫚🥔🍠🫘🥐🥯🍞🥖🥨🧀🥚🍳🧈🥞🧇🥓🥩🍗🍖🦴🌭🍔🍟🍕🫓🥪🥙🧆🌮🌯🫔🥗🥘🫕🥫🍝🍜🍲🍛🍣🍱🥟🦪🍤🍙🍚🍘🍥🥠🥮🍢🍡🍧🍨🍦🥧🧁🍰🎂🍮🍭🍬🍫🍿🍩🍪🌰🥜🍯🥛🍼🫖☕️🍵🧃🥤🧋🫙🍶🍺🍻🥂🍷🫗🥃🍸🍹🧉🍾🧊🥄🍴🍽🥣🥡🥢🧂';
  List<String> meals = [];
  double itemHeight = 90;
  double itemSpacing = 10;
  double dividerTickness = 2;
  double getLineHeight(int length) =>
      ((itemHeight + itemSpacing) / 2) - dividerTickness / 2;
  Color getLineColor(int systemSubId) => primary;
  // HexColor.fromHex(colorList[systemSubId]);
  @override
  void initState() {
    super.initState();
    fetchmeals();
  }

  fetchmeals() {
    context
        .read<BarnameViewBloc>()
        .add(FetchDaylimealEvent(basketId: widget.basketId));
  }

  String getIcon() {
    final icons = mealsicon.runes.map((e) => String.fromCharCode(e)).toList();
    return icons[Random().nextInt(icons.length)];
  }

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: BlocBuilder<BarnameViewBloc, BarnameViewState>(
            builder: (context, state) {
              String name = '';
              if (state is BarnameViewLoaded) {
                name = state.daylimeal?.name ?? '';
              }

              return AppBar(
                elevation: 4,
                shadowColor: Colors.black,
                backgroundColor: background,
                actions: [
                  AuthManager.readAccessToken() == null
                      ? SizedBox()
                      : Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: IconButton(
                              onPressed: () => dayliPDFCreator(pdfMeals, name),
                              icon: Icon(Icons.download_rounded)),
                        )
                ],
                title: state is BarnameViewLoaded
                    ? Builder(builder: (context) {
                        final daylimeal = state.daylimeal!;
                        final name = daylimeal.name;
                        final date = daylimeal.created;
                        return Row(
                          children: [
                            Text(name, style: context.anjomanBold),
                            Spacer(),
                            Text(format1(Jalali.fromDateTime(date)),
                                style: context.anjomanLight),
                          ],
                        );
                      })
                    : ShimmerWidget(80, 20),
              );
            },
          ),
        ),
        body: BlocConsumer<BarnameViewBloc, BarnameViewState>(
          listener: (context, state) {
            if (state is BarnameViewLoaded) {
              final daylimeal = state.daylimeal!;
              setState(() {
                meals = List.generate(daylimeal.daylimeal.length,
                    (index) => daylimeal.daylimeal[index].meal);
              });
            }
          },
          builder: (context, state) {
            if (state is BarnameViewLoading) {
              return Center(child: LoadingWidget());
            }

            if (state is BarnameViewError) {
              return Center(
                child: Text(
                  state.errormessage,
                  style: context.anjomanLight,
                ),
              );
            }

            if (state is BarnameViewLoaded) {
              final meal = state.daylimeal!.daylimeal;
              pdfMeals = meal;
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, i) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      replaceFarsiNumber(meal[i].meal),
                      style: context.anjomanSemiBold.copyWith(color: primary),
                    ),
                    SizedBox(height: 12),
                    Column(
                      spacing: 10,
                      children: List.generate(
                        meal[i].choices.length,
                        (index) => ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.05),
                                border: Border.all(color: Colors.white10),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Text(
                                '${getIcon()}  ${meal[i].choices[index].text}',
                                style: context.anjomanLight,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                separatorBuilder: (context, index) =>
                    Divider(height: 50, thickness: 8, color: Colors.white12),
                itemCount: meal.length,
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerWidget(
    this.width,
    this.height, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white10,
      highlightColor: Colors.white24,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
