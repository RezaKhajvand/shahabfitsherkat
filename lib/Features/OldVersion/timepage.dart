// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:shahabfit/Constants/BorderRadius.dart';
// import 'package:shahabfit/Constants/colors.dart';
// import 'package:shahabfit/Features/OldVersion/hivemodel/shagerd/shagerd.dart';
// import 'package:shahabfit/Features/OldVersion/replacefarsiandenglishnumber.dart';
// import 'package:shahabfit/Widgets/home_button.dart';

// // ignore: must_be_immutable
// class TimePage extends StatelessWidget {
//   TimePage({super.key});
//   var shagerdbox = Hive.box<HiveShagerd>('shagerdbox');

//   @override
//   Widget build(BuildContext context) {
//     var shagerds = shagerdbox.values
//         .toList()
//         .where((element) => element.khosusi == true)
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
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           foregroundColor: Colors.white,
//           titleSpacing: 10,
//           title: const Text(
//             'زمانبندی شاگردها',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           actions: const [HomeButton()],
//         ),
//         body: Container(
//             margin: const EdgeInsets.all(16),
//             padding: const EdgeInsets.all(16),
//             decoration: ShapeDecoration(
//               color: background,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   width: 1,
//                   color: borderColor,
//                 ),
//                 borderRadius: cardBorderRadius,
//               ),
//             ),
//             child: ListView.separated(
//               itemCount: 20,
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               reverse: true,
//               itemBuilder: (context, index) {
//                 if (index != 0 && index != 19) {
//                   var shagerdtimes = shagerds
//                       .where((element) =>
//                           element.workouttime == '${6 + index - 1}')
//                       .toList();
//                   return shagerdtimes.isNotEmpty
//                       ? Column(
//                           children: List.generate(
//                             shagerdtimes.length,
//                             (i) => Tooltip(
//                               message: shagerdtimes[i].name,
//                               child: Container(
//                                 width: 50,
//                                 height: 50,
//                                 margin: EdgeInsets.only(top: i == 0 ? 30 : 10),
//                                 decoration: ShapeDecoration(
//                                   color: const Color(0xFF2D2D2D),
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: cardBorderRadius,
//                                   ),
//                                 ),
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   replaceFarsiNumber(
//                                       shagerdtimes[i].id.toString()),
//                                   style: const TextStyle(
//                                     color: primary,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         )
//                       : const SizedBox(width: 50, height: 50);
//                 } else {
//                   return const SizedBox();
//                 }
//               },
//               separatorBuilder: (context, index) => Column(
//                 children: [
//                   Text(
//                     replaceFarsiNumber((6 + index).toString()),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Expanded(
//                     child: Container(
//                       width: 1,
//                       color: Colors.white24,
//                     ),
//                   )
//                 ],
//               ),
//             )),
//       ),
//     );
//   }
// }
