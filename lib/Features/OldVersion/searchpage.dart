// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shahabfit/Constants/BorderRadius.dart';
// import 'package:shahabfit/Constants/colors.dart';
// import 'package:shahabfit/Features/OldVersion/editpage.dart';
// import 'package:shahabfit/Features/OldVersion/ManagePage.dart';
// import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
// import 'package:shamsi_date/shamsi_date.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');
//   var jalasatdbox = Hive.box<HiveJalase>('jalasatbox');
//   final TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     List<HiveShagerd> shagerds = shagerdbox.values
//         .toList()
//         .where((element) =>
//             element.name.contains(controller.text) ||
//             element.id.toString() == controller.text ||
//             element.id.toString() == replaceEnglishNumber(controller.text))
//         .toList();
//     return Container(
//       decoration: const BoxDecoration(
//         color: Color(0xFF141414),
//         image: DecorationImage(
//           image: AssetImage('images/shahabbg.png'),
//           alignment: Alignment.topCenter,
//           fit: BoxFit.fitWidth,
//         ),
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(100),
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//               child: TextFormField(
//                 controller: controller,
//                 textInputAction: TextInputAction.search,
//                 onChanged: (value) => setState(() {}),
//                 style: const TextStyle(
//                     fontSize: 14, letterSpacing: 0, color: Colors.white),
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {});
//                       },
//                       icon: const Icon(Icons.search, color: primary)),
//                   prefixIcon: IconButton(
//                       onPressed: () => Navigator.pop(context),
//                       icon: const Icon(Icons.close, color: Colors.white)),
//                   border: OutlineInputBorder(
//                       borderRadius: cardBorderRadius,
//                       borderSide: BorderSide.none),
//                   fillColor: const Color.fromARGB(217, 13, 13, 13),
//                   hintStyle: const TextStyle(color: Colors.white30),
//                   hintText: 'جستجو',
//                   filled: true,
//                   contentPadding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
//                 ),
//               ),
//             ),
//           ),
//           body: ListView.separated(
//             itemCount: shagerds.length,
//             cacheExtent: 80,
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 90),
//             itemBuilder: (context, index) {
//               return Container(
//                 padding: const EdgeInsets.fromLTRB(0, 16, 16, 4),
//                 decoration: ShapeDecoration(
//                   color: background,
//                   shape: RoundedRectangleBorder(
//                     side: BorderSide(
//                       width: 1,
//                       color: borderColor,
//                     ),
//                     borderRadius: cardBorderRadius,
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: ShapeDecoration(
//                             color: const Color(0xFF2D2D2D),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: cardBorderRadius,
//                             ),
//                           ),
//                           alignment: Alignment.center,
//                           child: Text(
//                               shagerds[index].khosusi
//                                   ? '💎'
//                                   : shagerds[index].name.substring(0, 1),
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: shagerds[index].khosusi ? 30 : 20,
//                                 fontWeight: FontWeight.w600,
//                               )),
//                         ),
//                         const SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(shagerds[index].name,
//                                 style: const TextStyle(color: Colors.white)),
//                             const SizedBox(height: 4),
//                             RichText(
//                               text: TextSpan(
//                                 style: Theme.of(context).textTheme.labelSmall,
//                                 children: [
//                                   TextSpan(
//                                       text: replaceFarsiNumber(
//                                           '${shagerds[index].plan} جلسه'),
//                                       style: TextStyle(
//                                           color:
//                                               Colors.white.withOpacity(0.6))),
//                                   const TextSpan(text: ' ⚡ '),
//                                   TextSpan(
//                                       text: replaceFarsiNumber(
//                                           'کد : ${shagerds[index].id.toString()}')),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         shagerds[index].jalase >= shagerds[index].plan - 1 ||
//                                 DateTime.now()
//                                         .difference(
//                                             shagerds[index].registerdate)
//                                         .inDays >
//                                     30
//                             ? Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8, vertical: 5),
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                   color: const Color(0xFF00EFFF),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: tabBorderRadius,
//                                   ),
//                                 ),
//                                 child: const Text(
//                                   'منقضی',
//                                   style: TextStyle(
//                                     color: background,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               )
//                             : const SizedBox(),
//                         PopupMenuButton(
//                           color: Colors.white,
//                           onSelected: (value) async {
//                             var plan = shagerds[index].plan;
//                             late int planindex;

//                             switch (plan) {
//                               case 12:
//                                 planindex = 0;
//                               case 16:
//                                 planindex = 1;
//                               case 24:
//                                 planindex = 2;
//                             }

//                             if (value == 0) {
//                               bool? resault = await Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => EditPage(
//                                       shagerd: shagerds[index],
//                                       planindex: planindex,
//                                       typeindex: shagerds[index].khosusi == true
//                                           ? 1
//                                           : 0,
//                                     ),
//                                   ));
//                               if (resault==true) {
//                                 setState(() {});
//                               }
//                             }
//                             if (value == 1) {
//                               await shagerdbox.delete(shagerds[index].id);
//                               setState(() {});
//                             }
//                             if (value == 2) {
//                               final List<String> planlist = [
//                                 '۱۲ جلسه',
//                                 '۱۶ جلسه',
//                                 '۲۴ جلسه'
//                               ];
//                               // ignore: use_build_context_synchronously
//                               bool? resault = await showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) => Container(
//                                   color: background,
//                                   padding: const EdgeInsets.all(20),
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const Text(
//                                         'انتخاب پلن تمدید',
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600,
//                                             color: Colors.white),
//                                       ),
//                                       const SizedBox(height: 30),
//                                       Row(
//                                         mainAxisSize: MainAxisSize.max,
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: List.generate(
//                                             planlist.length,
//                                             (planindex) => ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                     backgroundColor:
//                                                         Colors.white),
//                                                 onPressed: () async {
//                                                   await shagerdbox.put(
//                                                       shagerds[index].id,
//                                                       HiveShagerd(
//                                                           name: shagerds[index]
//                                                               .name,
//                                                           phone: shagerds[index]
//                                                               .phone,
//                                                           jalase: 0,
//                                                           khosusi:
//                                                               shagerds[index]
//                                                                   .khosusi,
//                                                           workouttime:
//                                                               shagerds[index]
//                                                                   .workouttime,
//                                                           id: shagerds[index]
//                                                               .id,
//                                                           plan: getplan(
//                                                               planindex),
//                                                           registerdate:
//                                                               DateTime.now()));
//                                                   Navigator.pop(context, true);
//                                                 },
//                                                 child:
//                                                     Text(planlist[planindex]))),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                               if (resault==true) {
//                                 setState(() {});
//                               }
//                             }
//                           },
//                           itemBuilder: (context) => [
//                             PopupMenuItem(
//                               value: 0,
//                               textStyle: Theme.of(context).textTheme.bodySmall,
//                               child: const Text('ویرایش'),
//                             ),
//                             PopupMenuItem(
//                               value: 1,
//                               textStyle: Theme.of(context).textTheme.bodySmall,
//                               child: const Text('حذف'),
//                             ),
//                             PopupMenuItem(
//                               value: 2,
//                               textStyle: Theme.of(context).textTheme.bodySmall,
//                               child: const Text('تمدید'),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 18),
//                     Row(
//                       children: [
//                         Text(
//                           format1(shagerds[index].registerdate.toJalali()),
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           onPressed: () async {
//                             if (shagerds[index].jalase > 0) {
//                               if (jalasatdbox.values
//                                   .where((element) =>
//                                       element.shagerId == shagerds[index].id)
//                                   .isNotEmpty) {
//                                 var deleteKey = jalasatdbox.values
//                                     .where((element) =>
//                                         element.shagerId == shagerds[index].id)
//                                     .last
//                                     .key;
//                                 await jalasatdbox.delete(deleteKey);
//                               }

//                               shagerds[index].jalase--;
//                               await shagerds[index].save();
//                               setState(() {});
//                             }
//                           },
//                           icon: const Icon(Icons.remove_circle,
//                               color: primary, size: 32),
//                         ),
//                         Text(
//                           replaceFarsiNumber(' ${shagerds[index].jalase} '),
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         IconButton(
//                           onPressed: () async {
//                             if (jalasatdbox.values
//                                 .where((element) =>
//                                     element.shagerId == shagerds[index].id)
//                                 .isNotEmpty) {
//                               if (DateTime.now()
//                                       .difference(jalasatdbox.values
//                                           .where((element) =>
//                                               element.shagerId ==
//                                               shagerds[index].id)
//                                           .last
//                                           .jalaseDate)
//                                       .inHours >
//                                   2) {
//                                 await addJalase(shagerds[index]);
//                               } else {
//                                 ScaffoldMessenger.of(context).clearSnackBars();
//                                 HapticFeedback.mediumImpact();
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(SnackBar(
//                                   content: const Text('''
// در ۲ ساعت اخیر کلاس ثبت کرده اید
// آیا از افزودن جلسه اطمینان دارید؟
// '''),
//                                   action: SnackBarAction(
//                                     label: 'بله',
//                                     onPressed: () async =>
//                                         await addJalase(shagerds[index]),
//                                   ),
//                                 ));
//                               }
//                             } else {
//                               await addJalase(shagerds[index]);
//                             }
//                           },
//                           icon: const Icon(Icons.add_circle,
//                               color: primary, size: 32),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//             separatorBuilder: (context, index) => const SizedBox(height: 14),
//           ),
//         ),
//       ),
//     );
//   }

//   addJalase(HiveShagerd shagerds) async {
//     if (shagerds.jalase < shagerds.plan) {
//       await jalasatdbox.put(
//           jalasatdbox.values.isEmpty ? 1 : jalasatdbox.values.last.key + 1,
//           HiveJalase(shagerId: shagerds.id, jalaseDate: DateTime.now()));
//       //
//       shagerds.jalase++;
//       await shagerds.save();
//       setState(() {});
//     }
//   }
// }
