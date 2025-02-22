import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Features/Basket/Utils/PDFCreator.dart';
import 'package:shahabfit/Features/Daylimeal/models/pdftext_model.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shamsi_date/shamsi_date.dart';

pdfMealCreator(List<Meal> meals, String pdfName, String pdfText) async {
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
              lineSpacing: 2,
              font: ttf,
              fontSize: 12,
              color: const PdfColor(0, 0, 0, 0))),
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
                alignment: pw.Alignment.topRight,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.fromLTRB(160, 50, 4, 40),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: List.generate(
                      meals.length,
                      (mealIndex) => pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(meals[mealIndex].mealName,
                              style: const pw.TextStyle(color: PdfColors.red)),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: List.generate(
                                meals[mealIndex].choices.length,
                                (index) => pw.Padding(
                                      padding: const pw.EdgeInsets.only(top: 8),
                                      child: pw.Row(
                                        crossAxisAlignment:
                                            pw.CrossAxisAlignment.start,
                                        children: [
                                          pw.Text(
                                              'انتخاب شماره ${replaceFarsiNumber((index + 1).toString())} : '),
                                          pw.Expanded(
                                            child: pw.Text(meals[mealIndex]
                                                .choices[index]
                                                .replaceAll('\u200c', ' ')),
                                          )
                                        ],
                                      ),
                                    )),
                          ),
                          pw.SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

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
              pw.Text('توضیحات',
                  style: const pw.TextStyle(color: PdfColors.red)),
              pw.SizedBox(height: 4),
              pw.Text(pdfText.replaceAll('\u200c', ' '),
                  style: const pw.TextStyle(lineSpacing: 2)),
              pw.SizedBox(height: 12),
            ],
          ),
        );
      }));
  const String folderName = "shahabfit";
  const String path = "storage/emulated/0/$folderName";
  await Directory(path).create();
  try {
    File backupFile = File('$path/$pdfName.pdf');
    await backupFile.writeAsBytes(await pdf.save());
    OpenFile.open(backupFile.path);
  } catch (e) {
    print(e);
  }
}
