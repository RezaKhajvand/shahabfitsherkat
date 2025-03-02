import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Constants/colors.dart';
import 'package:shahabfit/Di.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';
import 'package:shamsi_date/shamsi_date.dart';

pdfCreator(List<ActivityItem> pdfItems, String pdfName, String pdfText) async {
  List filledDays = [];
  for (var element in pdfItems) {
    filledDays.add(element.dayOfWeek);
  }
  filledDays = {...filledDays}.toList();
  Map<int, String> weekDays = {
    0: 'جلسه اول',
    1: 'جلسه دوم',
    2: 'جلسه سوم',
    3: 'جلسه چهارم',
    4: 'جلسه پنجم',
    5: 'جلسه ششم',
    6: 'جلسه هفتم',
  }..removeWhere((key, value) => !filledDays.contains(key));
  final font = await rootBundle.load("fonts/Calibri.ttf");
  final ttf = pw.Font.ttf(font);
  final img = await rootBundle.load('images/pdf.jpg');
  final imageBytes = img.buffer.asUint8List();
  final pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl,
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
              font: ttf, fontSize: 8, color: const PdfColor(0, 0, 0, 0))),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Container(
          width: double.infinity,
          height: double.infinity,
          alignment: pw.Alignment.topCenter,
          decoration: pw.BoxDecoration(
            image: pw.DecorationImage(
                fit: pw.BoxFit.fill, image: pw.MemoryImage(imageBytes)),
          ),
          child: pw.Stack(
            fit: pw.StackFit.expand,
            children: [
              pw.Positioned(
                  left: 244,
                  top: 9,
                  child: pw.Text(pdfName,
                      style: const pw.TextStyle(fontSize: 12))),
              pw.Positioned(
                  left: 414,
                  top: 12,
                  child: pw.Text(format2(Jalali.now()),
                      style: const pw.TextStyle(fontSize: 9))),
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.GridView(
                  padding: const pw.EdgeInsets.fromLTRB(0, 40, 160, 40),
                  childAspectRatio: 2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    weekDays.length,
                    (dayIndex) {
                      var harakat = pdfItems
                          .where((element) =>
                              element.dayOfWeek ==
                              weekDays.keys.toList()[dayIndex])
                          .toList();

                      return pw.Container(
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Row(children: [
                              pw.Text(weekDays.values.toList()[dayIndex],
                                  style: pw.TextStyle(
                                      color: PdfColor.fromHex('#ff304f'))),
                              pw.Expanded(
                                  child: pw.Padding(
                                      padding: const pw.EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: pw.Divider(
                                          color: PdfColor.fromHex('#ff304f'))))
                            ]),
                            pw.SizedBox(height: 5),
                            pw.Column(
                              mainAxisSize: pw.MainAxisSize.min,
                              children: List.generate(harakat.length, (index) {
                                var activity = harakat[index];

                                return pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      vertical: 1),
                                  child: pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children: [
                                      pw.Builder(
                                        builder: (context) {
                                          if (activity.system != null &&
                                              activity.system!.isNotEmpty) {
                                            return pw.Container(
                                                height: 10,
                                                width: 4,
                                                decoration: pw.BoxDecoration(
                                                    border: pw.Border(
                                                        right: pw.BorderSide(
                                                            width: 2,
                                                            color: PdfColor.fromHex(
                                                                colorList[activity
                                                                    .systemSubId])))));
                                          } else {
                                            return pw.SizedBox();
                                          }
                                        },
                                      ),
                                      pw.Expanded(
                                          child: pw.Text(
                                              activity.expand.activity?.title ??
                                                  'بدون نام')),
                                      pw.SizedBox(width: 4),
                                      pw.Builder(
                                        builder: (context) {
                                          if (harakat.isNotEmpty &&
                                              harakat
                                                  .toList()[index]
                                                  .activitySet
                                                  .isNotEmpty) {
                                            var text = '';
                                            for (var element in harakat
                                                .toList()[index]
                                                .activitySet) {
                                              text = text +
                                                  (text.isEmpty ? '' : ' - ') +
                                                  (element.first == 1
                                                      ? '${element.last}'
                                                      : '${element.first}x${element.last}');
                                            }
                                            return pw.Flexible(
                                                child: pw.Text(text,
                                                    textDirection:
                                                        pw.TextDirection.ltr));
                                          }
                                          return pw.SizedBox();
                                        },
                                      ),
                                      pw.SizedBox(width: 4),
                                      pw.Text(
                                          activity.expand.system?.title ?? ''),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
  //
  //
  List<Map<String, String>> commentList = [];

  for (var element in pdfItems) {
    if (element.expand.system != null) {
      var mapItem = {
        element.expand.system!.title: element.expand.system!.description
      };
      if (!commentList
          .any((element) => element.keys.first == mapItem.keys.first)) {
        commentList.add(mapItem);
      }
    }
  }

  pdf.addPage(pw.Page(
      textDirection: pw.TextDirection.rtl,
      orientation: pw.PageOrientation.portrait,
      theme: pw.ThemeData(
          defaultTextStyle: pw.TextStyle(
              font: ttf, fontSize: 14, color: const PdfColor(0, 0, 0, 0))),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 30),
            child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  commentList.isNotEmpty
                      ? pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: List.generate(
                            commentList.length,
                            (index) => pw.Padding(
                              padding: const pw.EdgeInsets.only(bottom: 4),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(commentList[index].keys.first,
                                      style: const pw.TextStyle(
                                          color: PdfColors.red)),
                                  pw.SizedBox(height: 4),
                                  pw.Text(commentList[index].values.first,
                                      style: const pw.TextStyle(lineSpacing: 2))
                                ],
                              ),
                            ),
                          ),
                        )
                      : pw.SizedBox(),
                  pw.SizedBox(height: 60),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('توضیحات',
                          style: const pw.TextStyle(color: PdfColors.red)),
                      pw.SizedBox(height: 4),
                      pw.Text(pdfText,
                          style: const pw.TextStyle(lineSpacing: 2)),
                      pw.SizedBox(height: 12),
                    ],
                  ),
                ]));
      }));
  const String folderName = "shahabfit";
  const String path = "storage/emulated/0/$folderName";
  await Directory(path).create();
  File backupFile = File('$path/$pdfName.pdf');
  await backupFile.writeAsBytes(await pdf.save());
  OpenFile.open(backupFile.path);
}

String format2(Date d) {
  final f = d.formatter;

  return '${f.yyyy}/${f.mm}/${f.dd}';
}
