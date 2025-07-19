import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Utils/ColorExtension.dart';
import 'package:shahabfit/Utils/fotmat2.dart';
import 'package:shahabfit/Utils/get_current_url.dart';
import 'package:shahabfit/Utils/pdf_saver.dart';
import 'package:shahabfit/constants/colors.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

Future<void> pdfCreator(
  List<ActivityItem> pdfItems,
  String pdfName,
  String pdfText,
) async {
  final pdf = pw.Document(version: PdfVersion.pdf_1_4,);

  // استخراج روزهای پر شده
  final filledDays = pdfItems.map((e) => e.dayOfWeek).toSet().toList();

  final weekDays = {
    0: 'جلسه اول',
    1: 'جلسه دوم',
    2: 'جلسه سوم',
    3: 'جلسه چهارم',
    4: 'جلسه پنجم',
    5: 'جلسه ششم',
    6: 'جلسه هفتم',
  }..removeWhere((key, value) => !filledDays.contains(key));

  final fontData = await rootBundle.load("web/assets/fonts/CALIBRI.TTF");
  final ttf = pw.Font.ttf(fontData);
  final imageData = await rootBundle.load('images/pdf.png');
  final logoData = await rootBundle.load('images/logo.png');
  final imageBytes = imageData.buffer.asUint8List();
  final logoBytes = logoData.buffer.asUint8List();

  // صفحه اول
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      textDirection: pw.TextDirection.rtl,
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(
          font: ttf,
          fontSize: 8,
          color: PdfColor.fromHex('FFFFFF'),
        ),
      ),
      build: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          children: [
            pw.Positioned.fill(
              child: pw.Image(
                pw.MemoryImage(imageBytes),
                fit: pw.BoxFit.cover,
              ),
            ),
            pw.Column(
              children: [
                pw.Container(
                  width: PdfPageFormat.a4.width,
                  height: 50,
                  color: PdfColor.fromHex('E6FE58'),
                  alignment: pw.Alignment.center,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.symmetric(horizontal: 40),
                    child: pw.Row(
                      children: [
                        pw.Image(
                          pw.MemoryImage(logoBytes),
                          height: 20,
                          width: 60,
                          fit: pw.BoxFit.fitWidth,
                        ),
                        pw.Spacer(),
                        pw.Text(
                          '$pdfName  -  ${format2(Jalali.now())}',
                          style: pw.TextStyle(
                              fontSize: 10, color: PdfColors.black),
                        )
                      ],
                    ),
                  ),
                ),
                pw.Padding(
                  padding: pw.EdgeInsets.symmetric(vertical: 20),
                  child: pw.Wrap(
                    spacing: 40,
                    runSpacing: 20,
                    children: weekDays.entries.map(
                      (entry) {
                        final harakats = pdfItems
                            .where((e) => e.dayOfWeek == entry.key)
                            .toList();
                        return pw.Container(
                          width: (PdfPageFormat.a4.width - 120) / 2,
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Row(
                                children: [
                                  pw.Text(entry.value,
                                      style: pw.TextStyle(
                                          color: PdfColor.fromHex('E6FE58'))),
                                  pw.Expanded(
                                    child: pw.Padding(
                                      padding:
                                          const pw.EdgeInsets.only(right: 10),
                                      child: pw.Divider(
                                          color: PdfColor.fromHex('E6FE58')),
                                    ),
                                  ),
                                ],
                              ),
                              pw.SizedBox(height: 10),
                              ...harakats.map(
                                (activity) => pw.Padding(
                                  padding: const pw.EdgeInsets.symmetric(
                                      vertical: 4),
                                  child: pw.Row(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.center,
                                    children: [
                                      pw.Builder(
                                        builder: (context) {
                                          final channel = activity.systemSubId;
                                          final colorHex = HexColor.fromHex(
                                                  colorList[channel])
                                              .toHex();
                                          if (activity.system != '') {
                                            return pw.Container(
                                              height: 10,
                                              width: 4,
                                              decoration: pw.BoxDecoration(
                                                border: pw.Border(
                                                  right: pw.BorderSide(
                                                      width: 2,
                                                      color: PdfColor.fromHex(
                                                          colorHex)),
                                                ),
                                              ),
                                            );
                                          }
                                          return pw.SizedBox();
                                        },
                                      ),
                                      pw.SizedBox(width: 4),
                                      pw.Expanded(
                                        child: pw.Text(
                                          activity.expand.activity?.title ??
                                              'بدون نام',
                                        ),
                                      ),
                                      pw.SizedBox(width: 4),
                                      pw.Flexible(
                                        child: pw.Text(
                                          activity.activitySet.map((e) {
                                            return e.first == 1
                                                ? '${e.last}'
                                                : '${e.first}x${e.last}';
                                          }).join(' - '),
                                          textDirection: pw.TextDirection.ltr,
                                        ),
                                      ),
                                      pw.SizedBox(width: 4),
                                      pw.Text(
                                          activity.expand.system?.title ?? ''),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Padding(
                padding: pw.EdgeInsets.only(bottom: 10),
                child: pw.UrlLink(
                  destination: getCurrentUrl(),
                  child: pw.Text(
                    'لینک برنامه به همراه آموزش حرکات',
                    style: pw.TextStyle(
                      color: PdfColors.blue,
                      decoration: pw.TextDecoration.underline,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  // آماده‌سازی توضیحات
  final commentList = <Map<String, String>>{};
  for (var item in pdfItems) {
    final system = item.expand.system;
    if (system != null &&
        !commentList.any((e) => e.keys.first == system.title)) {
      commentList.add({system.title: system.description});
    }
  }

  // صفحه دوم - توضیحات
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      textDirection: pw.TextDirection.rtl,
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(
          font: ttf,
          fontSize: 10,
          color: PdfColor.fromHex('FFFFFF'),
        ),
      ),
      build: (context) => pw.FullPage(
        ignoreMargins: true,
        child: pw.Stack(
          alignment: pw.Alignment.topRight,
          children: [
            pw.Positioned.fill(
              child: pw.Image(
                pw.MemoryImage(imageBytes),
                fit: pw.BoxFit.cover,
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(40),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (commentList.isNotEmpty)
                    ...commentList.map((item) => pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 8),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(item.keys.first,
                                  style: pw.TextStyle(
                                      color: PdfColor.fromHex('E6FE58'))),
                              pw.SizedBox(height: 4),
                              pw.Text(item.values.first,
                                  style: pw.TextStyle(lineSpacing: 4)),
                            ],
                          ),
                        )),
                  pw.SizedBox(height: 60),
                  pw.Text('توضیحات',
                      style: pw.TextStyle(color: PdfColor.fromHex('E6FE58'))),
                  pw.SizedBox(height: 4),
                  pw.Text(pdfText, style: const pw.TextStyle(lineSpacing: 4)),
                ],
              ),
            ),
            pw.Align(
              alignment: pw.Alignment.bottomCenter,
              child: pw.Padding(
                padding: pw.EdgeInsets.only(bottom: 10),
                child: pw.UrlLink(
                  destination: getCurrentUrl(),
                  child: pw.Text(
                    'لینک برنامه به همراه آموزش حرکات',
                    style: pw.TextStyle(
                      color: PdfColors.blue,
                      decoration: pw.TextDecoration.underline,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  // ذخیره نهایی
  final pdfBytes = await pdf.save();
  await savePdfFile(pdfBytes, pdfName);
}
