import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/Router.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/oldversion/bloc/shagerdlist/shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/bloc/updateshagerd/update_shagerd_bloc.dart';
import 'package:shahabfit/Features/oldversion/utils/getplan.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Features/oldversion/utils/formatdatetime.dart';
import 'package:shahabfit/Features/oldversion/utils/shagerdtype.dart';
import 'package:shahabfit/Widgets/CustomSnackbars.dart';
import 'package:shahabfit/Widgets/custommodalsheet.dart';
import 'package:shahabfit/utils/texttheme.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';

class ShagerdList extends StatefulWidget {
  final ShagerdType type;

  const ShagerdList({super.key, required this.type});

  @override
  State<ShagerdList> createState() => _ShagerdListState();
}

class _ShagerdListState extends State<ShagerdList> {
  void fetchAllShagerd() =>
      context.read<ShagerdBloc>().add(FetchShagerdEvent());
  void fetchKhosusiShagerd() =>
      context.read<ShagerdBloc>().add(FetchShagerdEvent(khosusi: true));
  void fetchMonqziShagerd() =>
      context.read<ShagerdBloc>().add(FetchShagerdEvent(monqzi: true));

  @override
  void initState() {
    super.initState();
    fetchShagerd();
  }

  void fetchShagerd() {
    switch (widget.type) {
      case ShagerdType.all:
        fetchAllShagerd();
        break;
      case ShagerdType.khosusi:
        fetchKhosusiShagerd();
        break;
      case ShagerdType.monqzi:
        fetchMonqziShagerd();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShagerdBloc, ShagerdState>(
      builder: (context, state) {
        if (state is ShagerdError) {
          return Center(
              child: Text(
            state.message,
            textAlign: TextAlign.center,
            style: context.anjomanLight,
          ));
        }
        if (state is ShagerdLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ShagerdLoaded) {
          final shagerds = state.shagerdList;
          return Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('تعداد :', style: context.anjomanMedium),
                    Text(
                        '${replaceFarsiNumber(shagerds.length.toString())}  نفر',
                        style: context.anjomanMedium)
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                    cacheExtent: 80,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 90),
                    itemBuilder: (context, index) =>
                        BlocConsumer<UpdateShagerdBloc, UpdateShagerdState>(
                          listener: (context, updateState) {
                            if (updateState is UpdateShagerdError) {
                              getErrorSnackbar(context, updateState.message,
                                  action: updateState.shagerd != null
                                      ? SnackBarAction(
                                          label: 'بله',
                                          onPressed: () async => context
                                              .read<UpdateShagerdBloc>()
                                              .add(UpdateShagerdEvent(
                                                  shagerd: updateState.shagerd!,
                                                  action: UpdateAction
                                                      .increaseDirectly)),
                                        )
                                      : null);
                            }
                          },
                          builder: (context, updateState) {
                            if (updateState is UpdateShagerdSuccess) {
                              final shagerdIndex = shagerds.indexWhere(
                                  (element) =>
                                      element.id == updateState.shagerd.id);
                              if (shagerdIndex != -1) {
                                shagerds[shagerdIndex] = updateState.shagerd;
                              }
                            }
                            return Dismissible(
                              direction: DismissDirection.startToEnd,
                              background: Container(
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: cardBorderRadius,
                                ),
                                padding: const EdgeInsets.only(right: 50),
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.call),
                              ),
                              key: Key(index.toString()),
                              onUpdate: (details) async {
                                final call =
                                    Uri.parse('tel:${shagerds[index].phone}');
                                if (details.progress == 1) {
                                  if (await canLaunchUrl(call)) {
                                    launchUrl(call);
                                  } else {
                                    print('مشکل در برقراری تماس');
                                  }
                                }
                              },
                              confirmDismiss: (direction) async => false,
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 16, 16, 4),
                                decoration: ShapeDecoration(
                                  color: background,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 1, color: borderColor),
                                      borderRadius: cardBorderRadius),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF2D2D2D),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: cardBorderRadius,
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  shagerds[index]
                                                          .profileimage ??
                                                      '',
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(
                                                    Icons.person_4,
                                                    size: 30,
                                                    color: Colors.white12,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              shagerds[index].khosusi
                                                  ? Align(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      child: Icon(
                                                        Icons.diamond,
                                                        size: 20,
                                                        color: thumbsecend,
                                                      ))
                                                  : SizedBox()
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(shagerds[index].name,
                                                style: context.anjomanMedium),
                                            const SizedBox(height: 4),
                                            RichText(
                                              text: TextSpan(
                                                style: context.anjomanLight,
                                                children: [
                                                  TextSpan(
                                                      text: replaceFarsiNumber(
                                                          '${shagerds[index].plan} جلسه'),
                                                      style: context
                                                          .anjomanLight
                                                          .copyWith(
                                                              color: textColor
                                                                  .withValues(
                                                                      alpha:
                                                                          0.5))),
                                                  const TextSpan(text: ' ⚡ '),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        shagerds[index].jalase >=
                                                    int.parse(shagerds[index]
                                                            .plan) -
                                                        1 ||
                                                DateTime.now()
                                                        .difference(
                                                            shagerds[index]
                                                                .registerdate)
                                                        .inDays >
                                                    30
                                            ? Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.red
                                                      .withValues(alpha: 0.1),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        tabBorderRadius,
                                                  ),
                                                ),
                                                child: Text('منقضی',
                                                    style: context.anjomanLight
                                                        .copyWith(
                                                            color: Colors.red)),
                                              )
                                            : const SizedBox(),
                                        PopupMenuButton(
                                          color: Colors.white,
                                          onSelected: (value) async {
                                            if (value == 0) {
                                              await context.push(
                                                  editShagerdPage,
                                                  extra: shagerds[index]);
                                            }
                                            if (value == 1) {
                                              context.read<ShagerdBloc>().add(
                                                  DeleteShagerdEvent(
                                                      shagerd:
                                                          shagerds[index]));
                                            }
                                            if (value == 2) {
                                              final List<String> planlist = [
                                                '۱۲ جلسه',
                                                '۱۶ جلسه',
                                                '۲۴ جلسه'
                                              ];
                                              // ignore: use_build_context_synchronously
                                              bool? resault =
                                                  await customModalSheet(
                                                context,
                                                Container(
                                                  color: background,
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text('انتخاب پلن تمدید',
                                                          style: context
                                                              .anjomanBold),
                                                      const SizedBox(
                                                          height: 30),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: List.generate(
                                                            planlist.length,
                                                            (planindex) =>
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .white),
                                                                    onPressed:
                                                                        () async {
                                                                      BlocProvider.of<UpdateShagerdBloc>(context).add(UpdateShagerdEvent(
                                                                          shagerd: shagerds[index].copyWith(
                                                                            plan:
                                                                                getplan(planindex).toString(),
                                                                            jalase:
                                                                                0,
                                                                            registerdate:
                                                                                DateTime.now().toUtc(),
                                                                          ),
                                                                          action: UpdateAction.tamdid));
                                                                      context
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        planlist[
                                                                            planindex]))),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );

                                              if (resault == true) {
                                                // setState(() {});
                                              }
                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: 0,
                                              textStyle: context.anjomanLight,
                                              child: const Text('ویرایش'),
                                            ),
                                            PopupMenuItem(
                                              value: 1,
                                              textStyle: context.anjomanLight,
                                              child: const Text('حذف'),
                                            ),
                                            PopupMenuItem(
                                              value: 2,
                                              textStyle: context.anjomanLight,
                                              child: const Text('تمدید'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Text(
                                            format1(shagerds[index]
                                                .registerdate
                                                .toJalali()),
                                            style: context.anjomanLight),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () => context
                                              .read<UpdateShagerdBloc>()
                                              .add(UpdateShagerdEvent(
                                                  shagerd: shagerds[index],
                                                  action:
                                                      UpdateAction.decrease)),
                                          icon: const Icon(Icons.remove_circle,
                                              color: primary, size: 32),
                                        ),
                                        (updateState is UpdateShagerdLoading &&
                                                shagerds[index] ==
                                                    updateState.shagerd)
                                            ? SizedBox(
                                                height: 18,
                                                width: 18,
                                                child:
                                                    CircularProgressIndicator())
                                            : Text(
                                                replaceFarsiNumber(
                                                    ' ${shagerds[index].jalase} '),
                                                style: context.anjomanExtraBold
                                                    .copyWith(fontSize: 18),
                                              ),
                                        IconButton(
                                          onPressed: () => context
                                              .read<UpdateShagerdBloc>()
                                              .add(UpdateShagerdEvent(
                                                  shagerd: shagerds[index],
                                                  action:
                                                      UpdateAction.increase)),
                                          icon: const Icon(Icons.add_circle,
                                              color: primary, size: 32),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                    itemCount: shagerds.length),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
