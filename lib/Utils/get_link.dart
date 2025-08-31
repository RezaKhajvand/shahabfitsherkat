import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:shahabfit/Utils/get_current_url.dart';

pw.Align getLink() => pw.Align(
    alignment: pw.Alignment.bottomCenter,
    child: pw.UrlLink(
      child: pw.Container(
        padding: pw.EdgeInsets.all(10),
        margin: pw.EdgeInsets.only(bottom: 10),
        decoration: pw.BoxDecoration(
          border: pw.Border.all(
            color: PdfColors.white,
          ),
        ),
        child: pw.Text(
          'لینک برنامه به همراه آموزش حرکات',
          style: pw.TextStyle(
            color: PdfColors.blue,
            decoration: pw.TextDecoration.underline,
            fontSize: 10,
          ),
        ),
      ),
      destination: getCurrentUrl(),
    ));
