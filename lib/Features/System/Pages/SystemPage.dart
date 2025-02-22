import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shahabfit/Constants/BorderRadius.dart';
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shahabfit/Features/System/Bloc/System/system_bloc.dart';
import 'package:shahabfit/Features/Home/Widgets/Drawer.dart';
import 'package:shahabfit/Widgets/LoadingWidget.dart';
import 'package:shahabfit/Widgets/home_button.dart';

class SystemPage extends StatefulWidget {
  const SystemPage({super.key});

  @override
  State<SystemPage> createState() => _SystemPageState();
}

class _SystemPageState extends State<SystemPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SystemBloc>(context).add(GetSystemEvent());
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
        drawer: const CustomDrawer(),
        appBar: AppBar(
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          title: Text('لیست برنامه ها',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white)),
          actions: const [HomeButton()],
        ),
        body: BlocBuilder<SystemBloc, SystemState>(
          builder: (context, state) {
            if (state is SystemLoaded) {
              var systemList = state.system;
              return ListView.separated(
                itemCount: systemList.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  var item = systemList[index];
                  return Container(
                      decoration: ShapeDecoration(
                        color: background,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                            color: borderColor,
                          ),
                          borderRadius: cardBorderRadius,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () => systemBottomSheet(item),
                                  icon: const Icon(Icons.edit_outlined)),
                              IconButton(
                                  onPressed: () =>
                                      BlocProvider.of<SystemBloc>(context)
                                          .add(DeleteSystemEvent(id: item.id)),
                                  icon: const Icon(Icons.delete_outline))
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.description,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ));
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
              );
            }
            return const LoadingWidget();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            systemBottomSheet(null);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> systemBottomSheet(
    System? system,
  ) {
    final TextEditingController titleController =
        TextEditingController(text: system?.title);
    final TextEditingController descriptionController =
        TextEditingController(text: system?.description);
    return showModalBottomSheet(
      backgroundColor: background,
      barrierColor: Colors.transparent,
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(system == null ? 'افزودن سیستم' : 'ویرایش سیستم'),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      style: Theme.of(context).textTheme.labelSmall,
                      controller: titleController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        hintText: 'نام سیستم',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 3,
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        hintText: 'توضیحات',
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primary),
                          onPressed: () {
                            if (system == null) {
                              BlocProvider.of<SystemBloc>(context).add(
                                  AddSystemEvent(
                                      title: titleController.text,
                                      description: descriptionController.text));
                            } else {
                              BlocProvider.of<SystemBloc>(context).add(
                                  UpdateSystemEvent(
                                      id: system.id,
                                      title: titleController.text,
                                      description: descriptionController.text));
                            }
                          },
                          child: Text(system == null ? 'افزودن' : 'ویرایش')),
                    )
                  ],
                ),
              ),
              BlocConsumer<SystemBloc, SystemState>(
                listener: (context, state) {
                  if (state is SystemLoaded) {
                    context.pop();
                  }
                },
                builder: (context, state) {
                  if (state is SystemLoading) {
                    return const Material(
                      color: Colors.black54,
                      child: LoadingWidget(),
                    );
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
