import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/barnameview/bloc/barname_view_bloc.dart';
import 'package:shahabfit/Utils/texttheme.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';

class BarnameDetailPage extends StatefulWidget {
  final String recordId;
  const BarnameDetailPage({
    super.key,
    required this.recordId,
  });

  @override
  State<BarnameDetailPage> createState() => _BarnameDetailPageState();
}

class _BarnameDetailPageState extends State<BarnameDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<BarnameViewBloc>()
        .add(FetchActivityEvent(recordId: widget.recordId));
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
        appBar: AppBar(
          backgroundColor: background.withValues(alpha: 0.8),
          title: Text('توضیحات حرکت', style: context.anjomanExtraBold),
        ),
        body: BlocConsumer<BarnameViewBloc, BarnameViewState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BarnameViewLoaded) {
              final harkat = state.basketActivity.first;
              return ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Builder(builder: (context) {
                  final controller = harkat.chewieController;
                  if (controller == null) {
                    return LoadingWidget();
                  }
                  return Directionality(
                      textDirection: TextDirection.ltr,
                      child: Chewie(controller: controller));
                }),
              );
            }
            if (state is BarnameViewLoading) {
              return LoadingWidget();
            }
            if (state is BarnameViewError) {
              return Center(
                child: Text(state.errormessage, style: context.anjomanLight),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
