import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'download_pdf_web.dart' as js_helper;
import 'dart:js_interop';

import 'dart:io' as io;

Future<void> savePdfFile(Uint8List pdfBytes, String pdfName) async {
  if (kIsWeb) {
    // ✅ تبدیل Uint8List به JSAny
    final jsData = pdfBytes.toJS;
    js_helper.downloadPdf(jsData, "$pdfName.pdf");
  } else {
    final folderPath = "/storage/emulated/0/shahabfit";
    final dir = io.Directory(folderPath);
    if (!(await dir.exists())) {
      await dir.create(recursive: true);
    }
    final file = io.File('$folderPath/$pdfName.pdf');
    await file.writeAsBytes(pdfBytes);
  }
}
