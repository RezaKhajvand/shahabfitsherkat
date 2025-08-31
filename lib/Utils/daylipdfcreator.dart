import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Features/Daylimeal/models/daylimeal_list_model.dart';
import 'package:shahabfit/Features/oldversion/utils/replacefarsiandenglishnumber.dart';
import 'package:shahabfit/Utils/fotmat2.dart';
import 'package:shahabfit/Utils/get_link.dart';
import 'package:shahabfit/Utils/nimfasele.dart';
import 'package:shahabfit/Utils/pdf_saver.dart';
import 'package:shamsi_date/shamsi_date.dart';

Future<void> dayliPDFCreator(
  List<Daylimeal> meals,
  String pdfName,
) async {
  final pdf = pw.Document(
    version: PdfVersion.pdf_1_4,
  );
  final iransansFont =
      pw.Font.ttf(await rootBundle.load("fonts/IRANSans(FaNum).ttf"));

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
          font: iransansFont,
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
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Container(
                  width: PdfPageFormat.a4.width,
                  height: 50,
                  color: PdfColor.fromHex('E6FE58'),
                  alignment: pw.Alignment.center,
                  child: pw.Padding(
                    padding: pw.EdgeInsets.symmetric(horizontal: 20),
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
                  padding:
                      pw.EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: pw.Wrap(
                    spacing: 14,
                    runSpacing: 14,
                    children: List.generate(
                      meals.length,
                      (i) => pw.Container(
                        padding: pw.EdgeInsets.all(10),
                        decoration: pw.BoxDecoration(
                          // color: PdfColor.fromHex('131314'),
                          borderRadius: pw.BorderRadius.circular(5),
                          border: pw.Border.all(
                            color: PdfColors.white,
                          ),
                        ),
                        width: (PdfPageFormat.a4.width / 2) - 30,
                        height: 160,
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              replaceFarsiNumber(meals[i].meal),
                              style: pw.TextStyle(
                                color: PdfColor.fromHex('E6FE58'),
                                fontSize: 12,
                              ),
                            ),
                            pw.Expanded(
                              child: pw.FittedBox(
                                fit: pw.BoxFit.scaleDown,
                                alignment: pw.Alignment.topRight,
                                child: pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: List.generate(
                                    meals[i].choices.length,
                                    (index) => pw.Padding(
                                      padding: pw.EdgeInsets.only(top: 10),
                                      child: pw.Text(
                                        convertHalfSpaceToSpace(
                                            meals[i].choices[index].text),
                                        style: pw.TextStyle(lineSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            getLink()
          ],
        ),
      ),
    ),
  );

  // ذخیره نهایی
  final pdfBytes = await pdf.save();
  await savePdfFile(pdfBytes, pdfName);
}
