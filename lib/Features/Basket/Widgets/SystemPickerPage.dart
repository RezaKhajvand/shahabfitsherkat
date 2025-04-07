import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Features/Basket/Bloc/Basket/basket_bloc.dart';
import 'package:shahabfit/constants/borderradius.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shahabfit/Features/System/Bloc/System/system_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shahabfit/constants/router.dart';

class SystemPickerPage extends StatefulWidget {
  final String recordId;
  final String basketId;
  const SystemPickerPage({
    super.key,
    required this.recordId,
    required this.basketId,
  });

  @override
  State<SystemPickerPage> createState() => _SystemPickerPageState();
}

class _SystemPickerPageState extends State<SystemPickerPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SystemBloc>(context).add(GetSystemEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          title: const Text('انتخاب سیستم'), backgroundColor: background),
      body: BlocBuilder<SystemBloc, SystemState>(
        builder: (context, state) {
          if (state is SystemLoaded) {
            var systemList = state.system;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: systemList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16),
              itemBuilder: (context, index) => InkWell(
                borderRadius: cardBorderRadius,
                onTap: () {
                  customModalSheet(
                    context,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'انتخاب کانال',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'برای تفکیک سیستم های یکسان نیاز به انتخاب کانال متفاوت میباشد ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 20),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 45,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12),
                            itemBuilder: (context, channelIndex) =>
                                OutlinedButton(
                                    onPressed: () {
                                      BlocProvider.of<BasketBloc>(context).add(
                                          UpdateBasketActivityEvent(
                                              basketActivityId: widget.recordId,
                                              system: systemList[index],
                                              systemSubId: channelIndex + 1));
                                      context.go(
                                          '$basketPage?basketId=${widget.basketId}&tabIndex=0');
                                    },
                                    child: Text(
                                        'کانال : ${replaceFarsiNumber((channelIndex + 1).toString())}')),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: cardBorderRadius,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: cardBorderRadius,
                      border: Border.all(color: Colors.white12),
                      color: Colors.white10,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        systemList[index].title,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const LoadingWidget();
        },
      ),
    );
  }
}
