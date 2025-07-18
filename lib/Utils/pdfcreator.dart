import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Utils/fotmat2.dart';
import 'package:shahabfit/Utils/pdf_saver.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:shahabfit/Features/Activities/Models/BasketActivityModel.dart';

Future<void> pdfCreator(
  List<ActivityItem> pdfItems,
  String pdfName,
  String pdfText,
) async {
  final pdf = pw.Document();

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

  final fontData = await rootBundle.load("web/assets/fonts/Anjoman-Medium.ttf");
  final ttf = pw.Font.ttf(fontData);
  // final imageData = await rootBundle.load('images/pdf.jpg');
  // final imageBytes = imageData.buffer.asUint8List();

  // صفحه اول
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      orientation: pw.PageOrientation.portrait,
      textDirection: pw.TextDirection.rtl,
      theme: pw.ThemeData(
        defaultTextStyle: pw.TextStyle(font: ttf, fontSize: 8),
      ),
      build: (context) => pw.Container(
        // decoration: pw.BoxDecoration(
        //   image: pw.DecorationImage(
        //     fit: pw.BoxFit.fill,
        //     image: pw.MemoryImage(imageBytes),
        //   ),
        // ),
        child: pw.Stack(
          children: [
            pw.Positioned(
              right: 16,
              top: 0,
              child: pw.Text('$pdfName  -  ${format2(Jalali.now())}',
                  style: pw.TextStyle(fontSize: 12)),
            ),
            pw.Align(
              alignment: pw.Alignment.topCenter,
              child: pw.Padding(
                padding: const pw.EdgeInsets.fromLTRB(0, 40, 160, 40),
                child: pw.GridView(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  children: weekDays.entries.map((entry) {
                    final harakats = pdfItems
                        .where((e) => e.dayOfWeek == entry.key)
                        .toList();

                    return pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Text(entry.value,
                                style: pw.TextStyle(
                                    color: PdfColor.fromHex('#ff304f'))),
                            pw.Expanded(
                              child: pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: pw.Divider(
                                    color: PdfColor.fromHex('#ff304f')),
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 5),
                        ...harakats.map((activity) => pw.Padding(
                              padding:
                                  const pw.EdgeInsets.symmetric(vertical: 1),
                              child: pw.Row(
                                crossAxisAlignment:
                                    pw.CrossAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    height: 10,
                                    width: 4,
                                    decoration: pw.BoxDecoration(
                                      border: pw.Border(
                                        right: pw.BorderSide(
                                          width: 2,
                                          color: PdfColors.blueGrey,
                                        ),
                                      ),
                                    ),
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
                                  pw.Text(activity.expand.system?.title ?? ''),
                                ],
                              ),
                            )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  // توضیحات سیستم‌ها
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
        defaultTextStyle: pw.TextStyle(font: ttf, fontSize: 14),
      ),
      build: (context) => pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 30),
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
                            style: pw.TextStyle(color: PdfColors.red)),
                        pw.SizedBox(height: 4),
                        pw.Text(item.values.first),
                      ],
                    ),
                  )),
            pw.SizedBox(height: 60),
            pw.Text('توضیحات', style: pw.TextStyle(color: PdfColors.red)),
            pw.SizedBox(height: 4),
            pw.Text(pdfText, style: const pw.TextStyle(lineSpacing: 2)),
          ],
        ),
      ),
    ),
  );

  // ذخیره یا دانلود فایل PDF
  final pdfBytes = await pdf.save();
  await savePdfFile(pdfBytes, pdfName);
}
